require "docking_station"

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes when bikes are available' do
    subject.dock_bike(double(:bike))
    expect(subject.release_bike.working?).to be true
  end
  it 'does not release working bikes when bikes are N/A' do
    expect{subject.release_bike}.to raise_error('No bikes in bike rack')
  end
  it 'does not dock bikes when bikes are Full' do
    (subject.capacity).times do
      subject.bikes.append(double(:bike))
    end
    expect{subject.dock_bike(double(:bike))}.to raise_error("Bike rack is full")
  end
  it 'it docks bikes when not full' do
    expect(subject.dock_bike(double(:bike))).to eq("bike docked")
  end
  it 'it allows a broken bike to be reported when being docked' do
    expect(subject.dock_bike(double(:bike),true)).to eq("bike docked")
  end
  it 'it doesnt allow a broken bike to be released' do
    subject.dock_bike(double(:bike),true)
    expect{subject.release_bike}.to raise_error("No working bikes in rack")
  end

  it 'releases working bikes' do
    # let's substitute our double(:bike)
    # for a double
    subject.dock_bike(double(:bike))
    # no error yet: and no problem when
    # we release the 'bike': we just
    # get the double we made
    bike = subject.release_bike
    # a problem here: this double doesn't
    # know how to respond_to working?
    # (we'll deal with that in the next
    # challenge: mocking behaviour).
    expect(bike.working?).to be true
  end

end
