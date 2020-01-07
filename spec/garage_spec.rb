require "garage"

describe Garage do
  let(:working_bike){double :working_bike, :fixed => true, :working? => true}
  let(:broken_bike){double :bike_broken, :working? => false}

  describe '#van_drop_off' do
    it 'allows bikes to be dropped off' do
      expect(subject).to respond_to(:van_drop_off).with(1).argument
    end
  end

  describe '#fix_bikes' do
    it 'fixes bikes' do
      subject.van_drop_off([working_bike])
      expect(working_bike).to receive(:fixed)
      subject.fix_bikes
    end
  end

  describe '#van_pick_up' do
    it 'allows bikes to be picked up' do
      subject.van_drop_off([working_bike])
      expect(subject.van_pick_up).to eq([working_bike])
    end
    it 'only picks up fixed bikes' do
      subject.van_drop_off([working_bike, broken_bike])
      expect(subject.van_pick_up).not_to include(broken_bike)
    end
  end
end
