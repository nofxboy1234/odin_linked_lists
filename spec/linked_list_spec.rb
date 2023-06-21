require './lib/linked_list'

RSpec.describe LinkedList do
  subject(:linked_list) { described_class.new }
  let(:list) { linked_list.list }

  describe '#append' do
    context 'when a new node with value 100 is appended' do
      it 'increases the list size by 1' do
        expect { linked_list.append(100) }.to change { list.size }.by(1)
      end

      it 'adds a new node containing value 100 to the end of the list' do
        linked_list.append(100)
        expect(list.last.value).to eq(100)
      end
    end
  end

  describe '#prepend' do
    context 'when a new node with value 200 is prepended' do
      it 'increases the list size by 1' do
        expect { linked_list.prepend(200) }.to change { list.size }.by(1)
      end

      it 'adds a new node containing value 200 to the end of the list' do
        linked_list.prepend(200)
        expect(list.first.value).to eq(200)
      end
    end
  end

  describe '#size' do
    context 'when no nodes have been appended to the list' do
      it 'returns 0' do
        expect(linked_list.size).to eq(0)
      end
    end

    context 'when 1 node has been appended to the list' do
      it 'returns 1' do
        linked_list.append(300)
        expect(linked_list.size).to eq(1)
      end
    end
  end

  describe '#head' do
    context 'when a node with value 400 is prepended' do
      it 'returns that node with value 400' do
        linked_list.prepend(400)
        expect(linked_list.head.value).to eq(400)
      end
    end
  end

  describe '#tail' do
    it 'returns the last node in the list'
  end

  describe '#at' do
    it 'returns the node at the given index'
  end

  describe '#pop' do
    it 'removes the last element from the list'
  end

  describe '#contains?' do
    it 'returns true if the passed in value is in the list and otherwise returns false'
  end

  describe '#find' do
    it 'returns the index of the node containing "value", or nil if not found'
  end

  describe '#to_s' do
    it 'returns a string representation of the linked list'
  end
end
