require './lib/linked_list'

RSpec.describe LinkedList do
  subject(:linked_list) { described_class.new }

  describe '#append' do
    context 'when linked_list is empty' do
      xit 'increases the size of linked_list from 0 to 1' do
        expect { linked_list.append(200) }.to change { linked_list.size }.from(0).to(1)
      end
    end
    
    context 'when linked_list is not empty' do
      xit 'has a head node which is the same as the prepended node' do
        prepended_node = linked_list.append(400)
        expect(linked_list.head).to be(prepended_node)
      end

      xit 'increases the size of linked_list from 1 to 2' do
        linked_list.append(700)
        expect { linked_list.append(200) }.to change { linked_list.size }.from(1).to(2)
      end
    end
  end

  describe '#prepend' do
    context 'when linked_list is empty' do
      it 'increases the size of linked_list from 0 to 1' do
        expect { linked_list.prepend(200) }.to change { linked_list.size }.from(0).to(1)
      end
    end
    
    context 'when linked_list is not empty' do
      it 'has a head node which is the same as the prepended node' do
        prepended_node = linked_list.prepend(400)
        expect(linked_list.head).to be(prepended_node)
      end

      it 'increases the size of linked_list from 1 to 2' do
        linked_list.prepend(700)
        expect { linked_list.prepend(200) }.to change { linked_list.size }.from(1).to(2)
      end
    end
  end

  describe '#size' do
    context 'when no nodes have been prepended/appended/inserted etc to the linke_list' do
      it 'returns 0' do
        expect(linked_list.size).to eq(0)
      end
    end

    context 'when 1 node has been prepended to the linked_list' do
      it 'returns 1' do
        linked_list.prepend(300)
        expect(linked_list.size).to eq(1)
      end
    end
  end

  describe '#head' do
    context 'when linked_list is empty' do
      it 'returns a node with a nil value' do
        expect(linked_list.head.value).to be_nil
      end
    end

    context 'when linked_list is not empty' do
      it 'returns the first node' do
        first_node = linked_list.prepend(400)
        expect(linked_list.head).to be(first_node)
      end
    end
  end

  describe '#tail' do
    xit 'returns the last node in the list'
  end

  describe '#at' do
    xit 'returns the node at the given index'
  end

  describe '#pop' do
    xit 'removes the last element from the list'
  end

  describe '#contains?' do
    xit 'returns true if the passed in value is in the list and otherwise returns false'
  end

  describe '#find' do
    xit 'returns the index of the node containing "value", or nil if not found'
  end

  describe '#to_s' do
    xit 'returns a string representation of the linked list'
  end
end
