require './lib/node'

RSpec.describe Node do
  subject(:node) { described_class.new }

  describe '#value' do
    context 'when @value is not set' do
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
    let(:another_node) { described_class.new('another_node') }

    before do
      node.next_node = another_node
    end

    it 'updates the value of @next_node' do
      expect(node.next_node).to be(another_node)
    end
  end

  describe '#to_s' do
    context 'when the value is nil' do
      it 'returns "(  )"' do
        output = '(  )'

        expect(node.to_s).to eq(output)
        expect { puts node }.to output("#{output}\n").to_stdout
      end
    end

    context 'when the value is not nil' do
      context 'when node has value 100' do
        subject(:node) { described_class.new(100) }

        it 'returns "( 100 )"' do
          output = '( 100 )'
  
          expect(node.to_s).to eq(output)
          expect { puts node }.to output("#{output}\n").to_stdout
        end
      end
    end
  end
end
