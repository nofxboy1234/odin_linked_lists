require './lib/node'

RSpec.describe Node do
  describe '#value' do
    context 'when @value is not set' do
      subject(:node) { described_class.new }

      it 'returns nil' do
        expect(node.value).to eq(nil)
      end
    end

    context 'when @value is set to 100' do
      subject(:node) { described_class.new(100) }

      it 'returns 100' do
        expect(node.value).to eq(100)
      end
    end
  end

  describe '#next_node' do
    context 'when @next_node is not set' do
      subject(:node) { described_class.new }

      it 'returns nil' do
        expect(node.next_node).to eq(nil)
      end
    end

    context 'when @next_node is set to another_node' do
      subject(:node) { described_class.new('root', another_node) }
      let(:another_node) { described_class.new('another_node') }

      it 'returns another_node' do
        expect(node.next_node).to be(another_node)
      end
    end
  end

  describe '#next_node=' do
    subject(:node) { described_class.new }
    let(:another_node) { described_class.new('another_node') }

    before do
      node.next_node = another_node
    end

    it 'updates the value of @next_node' do
      expect(node.next_node).to be(another_node)
    end
  end
end
