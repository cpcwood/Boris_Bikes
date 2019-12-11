require "docking_station"

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes when bikes are available' do
    bike = subject.release_bike
    expect(bike).to be_working
  end
  it 'does not release working bikes when bikes are N/A' do
    subject.bikes.clear
    expect{subject.release_bike}.to raise_error
  end
  it 'does not dock bikes when bikes are Full' do
    subject = DockingStation.new
    (subject.capacity - 1).times do
      subject.bikes.append(Bike.new)
    end
    puts subject.bikes.count
    expect{subject.dock_bike}.to raise_error
  end
  it 'it docks bikes when not full' do
    bike = subject.release_bike
    expect(subject.dock_bike(bike)).to be true
  end
end
