require "docking_station"

describe DockingStation do

  let(:bike) { double :bike }

  before(:each) do
    allow(bike).to receive(:working?).and_return(true)
    allow(bike).to receive(:broken)
  end

  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes when bikes are available' do
    subject.dock_bike(bike)
    expect(subject.release_bike.working?).to be true
  end
  it 'does not release working bikes when bikes are N/A' do
    expect{subject.release_bike}.to raise_error('No bikes in bike rack')
  end
  it 'does not dock bikes when bikes are Full' do
    (subject.capacity).times do
      subject.bikes.append(bike)
    end
    expect{subject.dock_bike(bike)}.to raise_error("Bike rack is full")
  end
  it 'it docks bikes when not full' do
    expect(subject.dock_bike(bike)).to eq("bike docked")
  end
  it 'it allows a broken bike to be reported when being docked' do
    expect(subject.dock_bike(bike,true)).to eq("bike docked")
  end
  it 'it doesnt allow a broken bike to be released' do
    bike = double("bike", :working? => false, :broken => false)
    subject.dock_bike(bike,true)
    expect{subject.release_bike}.to raise_error("No working bikes in rack")
  end

  it 'allows bikes to be picked up if broken' do
    broken_1 = double("broken_1", :working? => false, :broken => false)
    broken_2 = double("broken_2", :working? => false, :broken => false)
    working_1 = double("working_1", :working? => true)
    subject.dock_bike(broken_1,true)
    subject.dock_bike(broken_2,true)
    subject.dock_bike(working_1)
    expect(subject.van_pick_up).to eq [broken_1, broken_2]
  end

end
