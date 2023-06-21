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
    it 'adds a new node containing "value" to the start of the list'
  end

  describe '#size' do
    it 'returns the total number of nodes in the list'
  end

  describe '#head' do
    it 'returns the first node in the list'
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
