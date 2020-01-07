require "docking_station"

describe DockingStation do

  let(:bike){double :bike, :working? => true, :broken => nil}
  let(:broken_bike){double :broken_bike, :working? => false, :broken => nil}
  let(:broken_bike2){double :broken_bike2, :working? => false, :broken => nil}

  describe '#release_bike' do
    it 'releases working bikes when bikes are available' do
      subject.dock_bike(bike: bike)
      expect(subject.release_bike).to eq bike
    end
    it 'doesnt release working bikes when there are none available' do
      expect{subject.release_bike}.to raise_error('No bikes in bike rack')
    end
    it 'it doesnt allow a broken bike to be released' do
      subject.dock_bike(bike: broken_bike, broken: true)
      expect{subject.release_bike}.to raise_error("No working bikes in rack")
    end
  end

  describe '#dock_bike' do
    it 'allows docked bikes to be released' do
      subject.dock_bike(bike: bike)
      expect(subject.release_bike).to eq bike
    end
    it 'does not dock bikes when bike rack is full' do
      20.times {subject.dock_bike(bike: bike)}
      expect{subject.dock_bike(bike: bike)}.to raise_error("Bike rack is full")
    end
    it 'it allows a broken bike to be reported when being docked' do
      expect(subject).to respond_to(:dock_bike)
    end
    it 'changes bike working status when docked as broken' do
      expect(broken_bike).to receive(:broken)
      subject.dock_bike(bike: broken_bike, broken: true)
    end
  end

  describe '#van_pick_up' do
    it 'allows bikes to be picked up if broken' do
      subject.dock_bike(bike: broken_bike, broken: true)
      subject.dock_bike(bike: bike)
      expect(subject.van_pick_up).to eq [broken_bike]
    end
    it 'removes picked up bikes from dock' do
      subject.dock_bike(bike: broken_bike, broken: true)
      subject.van_pick_up
      expect{subject.release_bike}.to raise_error('No bikes in bike rack')
    end
  end

  describe '#van_drop_off' do
    it 'allows fixed bikes to be dropped off' do
      expect(subject).to respond_to(:van_drop_off).with(1).argument
    end
    it 'adds dropped off fixed bikes to bike rack' do
      subject.van_drop_off([bike])
      expect(subject.release_bike).to eq bike
    end
  end
end
