require "garage"

describe Garage do

  it 'allows bikes to be dropped off' do
    bike = double("bike")
    subject.van_drop_off([bike])
    expect(subject.bikes).to eq([bike])
  end

  it 'allows bikes to be picked up' do
    bike = double("bike")
    subject.bikes = [bike]
    expect(subject.van_pick_up).to eq([bike])
  end
end
