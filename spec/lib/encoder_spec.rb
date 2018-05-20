require 'encoder'

RSpec.describe Encoder do
  describe '.encode' do
    it 'returns code with at least 6 characters' do
      expect(Encoder.encode(1)).to eq('000001')
    end
  end

  describe '.decode' do
    it 'returns decoded integer' do
      expect(Encoder.decode('000001')).to eq(1)
    end
  end
end