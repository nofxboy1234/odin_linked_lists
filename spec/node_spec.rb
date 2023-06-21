require './lib/node'

RSpec.describe Node do
  
  describe '#value' do
    context 'when value is not set' do
      subject(:node) { described_class.new }

      it 'returns nil' do
        expect(node.value).to eq(nil)
      end
    end
    
    context 'when value is set to 100' do
      subject(:node) { described_class.new(100) }

      it 'returns 100' do
        expect(node.value).to eq(100)
      end
    end
  end

  describe '#next_node' do
    it 'returns the next node'
  end
end
