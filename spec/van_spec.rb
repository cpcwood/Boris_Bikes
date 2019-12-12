require "van"

describe Van do

  it 'picks up broken bikes from docking station' do
    docking_station = double("docking_station", :van_pick_up => ["bike_1", "bike_2"])
    expect(subject.pick_broken_bikes(docking_station)).to eq(["bike_1", "bike_2"])
  end

  it 'drops broken bikes to garage and van is then empty' do
    garage = double("garage", :van_drop_off => nil)
    subject.broken_bikes = ["bike_1", "bike_2"]
    subject.drop_broken_bikes(garage)
    expect(subject.broken_bikes).to eq([])
  end

  it 'picks up fixed bikes from garage' do
    garage = double("garage", :van_pick_up => ["bike_1", "bike_2"])
    expect(subject.pick_fixed_bikes(garage)).to eq(["bike_1", "bike_2"])
  end

  it "drops fixed bikes to docking station and van is then empty" do
    docking_station = double("docking_station", :van_drop_off => nil)
    subject.fixed_bikes = ["bike_1", "bike_2"]
    subject.drop_fixed_bikes(docking_station)
    expect(subject.fixed_bikes).to eq([])
  end
end
