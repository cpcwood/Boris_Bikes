require "van"

describe Van do

  let(:working_bike){double :working_bike, :working? => true}
  let(:broken_bike){double :broken_bike, :working? => false}
  let(:location){double :docking_station, :van_drop_off => nil, :van_pick_up => [working_bike, broken_bike]}

  describe '#pick_broken_bikes' do
    it 'picks up bikes from docking station' do
      expect(location).to receive(:van_pick_up)
      subject.pick_up_bikes(location)
    end
  end

  describe '#drop_bikes' do
    it 'drops fixed bikes to location' do
      subject.pick_up_bikes(location)
      expect(location).to receive(:van_drop_off).with([working_bike])
      subject.drop_bikes(location: location, working: true)
    end
    it 'drops broken bikes to location' do
      subject.pick_up_bikes(location)
      expect(location).to receive(:van_drop_off).with([broken_bike])
      subject.drop_bikes(location: location, working: false)
    end
    it 'removes dropped bikes from van' do
      subject.pick_up_bikes(location)
      subject.drop_bikes(location: location, working: true)
      expect{subject.drop_bikes(location: location, working: true)}.to raise_error('No bikes to drop')
    end
  end
end
