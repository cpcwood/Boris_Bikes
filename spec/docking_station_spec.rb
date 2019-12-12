require "docking_station"

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes when bikes are available' do
    expect(subject.release_bike).to be_working
  end
  it 'does not release working bikes when bikes are N/A' do
    subject.bikes.clear
    expect{subject.release_bike}.to raise_error('No bikes in bike rack')
  end
  it 'does not dock bikes when bikes are Full' do
    subject = DockingStation.new
    (subject.capacity - 1).times do
      subject.bikes.append(Bike.new)
    end
    expect{subject.dock_bike(Bike.new)}.to raise_error("Bike rack is full")
  end
  it 'it docks bikes when not full' do
    bike = subject.release_bike
    expect(subject.dock_bike(bike)).to eq("bike docked")
  end
  it 'it allows a broken bike to be reported when being docked' do
    bike = subject.release_bike
    expect(subject.dock_bike(bike,true)).to eq("bike docked")
  end
  it 'it doesnt allow a broken bike to be released' do
    bike = subject.release_bike
    subject.dock_bike(bike,true)
    expect{subject.release_bike}.to raise_error("No working bikes in rack")
  end
end
