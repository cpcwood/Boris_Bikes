require "bike"

describe Bike do
  describe '#working' do
    it 'initializes working' do
      expect(subject.working?).to eq true
    end
  end
  describe '#broken' do
    it 'changes working status to false' do
      expect{subject.broken}.to change{subject.working?}.to false
    end
  end
  describe '#fixed' do
    it 'changes working status to true' do
      subject.broken
      expect{subject.fixed}.to change{subject.working?}.to true
    end
  end
end
