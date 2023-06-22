require './lib/linked_list'

RSpec.describe LinkedList do
  subject(:linked_list) { described_class.new }

  describe '#append' do
    it 'increases the size of linked_list by 1' do
      expect { linked_list.append(200) }.to change { linked_list.size }.by(1)
    end
    
    context 'when linked_list is empty' do
      it 'sets @head to the node that is returned' do
        appended_node = linked_list.append(200)
        expect(linked_list.head).to be(appended_node)
      end

      it 'sets @tail to be the same node as @head' do
        linked_list.append(200)
        expect(linked_list.tail).to be(linked_list.head)
      end
    end

    context 'when linked_list is not empty' do
      it 'sets @tail to the node that is returned' do
        appended_node = linked_list.append(200)
        expect(linked_list.tail).to be(appended_node)
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
    context 'when no nodes have been prepended/appended/inserted etc to the linked_list' do
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

      it 'does not increment @size' do
        expect { linked_list.head }.not_to change { linked_list.size }
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
    context 'when linked_list is empty' do
      it 'returns a node with value of nil' do
        expect(linked_list.tail.value).to be_nil
      end

      it 'returns the head node' do
        expect(linked_list.tail).to be(linked_list.head)
      end
    end

    context 'when a node with has been appended to the end of linked_list' do
      it 'returns a that same last node' do
        appended_node = linked_list.append(99)
        expect(linked_list.tail).to be(appended_node)
      end
    end
  end

  describe '#at' do
    context 'when 3 nodes of values 100, 200, 300 are appended to an empty linked_list' do
      it 'returns the node at the given index' do
        appended_node100 = linked_list.append(100)
        appended_node200 = linked_list.append(200)
        appended_node300 = linked_list.append(300)

        expect(linked_list.at(1)).to be(appended_node100)
      end
    end
  end

  describe '#pop' do
    it 'returns the old_tail node that was removed' do
      linked_list.prepend(100)
      new_tail = linked_list.append(200)
      old_tail = linked_list.append(300)
      
      # binding.pry
      expect(linked_list.pop).to be(old_tail)
    end
    
    it 'sets @tail to new_tail' do
      linked_list.prepend(100)
      new_tail = linked_list.append(200)
      old_tail = linked_list.append(300)

      linked_list.pop
      expect(linked_list.tail).to be(new_tail)
    end

    it 'sets @next_node of new_tail to nil' do
      linked_list.prepend(100)
      new_tail = linked_list.append(200)
      old_tail = linked_list.append(300)

      linked_list.pop
      expect(new_tail.next_node).to be_nil
    end
  end

  describe '#contains?' do
    before do
      linked_list.append(100)
      linked_list.append(200)
      linked_list.append(300)
    end

    context 'when the value 100 is in the linked list' do
      it 'returns true' do
        expect(linked_list.contains?(100)).to eq(true)
      end
    end

    context 'when the value 200 is in the linked list' do
      it 'returns true' do
        expect(linked_list.contains?(200)).to eq(true)
      end
    end

    context 'when the value 300 is in the linked list' do
      it 'returns true' do
        expect(linked_list.contains?(300)).to eq(true)
      end
    end

    context 'when the value 400 is not in the linked list' do
      it 'returns true' do
        expect(linked_list.contains?(400)).to eq(false)
      end
    end
  end

  describe '#find' do
    before do
      linked_list.append(100)
      linked_list.append(200)
      linked_list.append(300)
    end

    context 'when the value 100 is in the linked list' do
      it 'returns the index 1' do
        expect(linked_list.find(100)).to eq(1)
      end
    end

    context 'when the value 200 is in the linked list' do
      it 'returns the index 2' do
        expect(linked_list.find(200)).to eq(2)
      end
    end

    context 'when the value 300 is in the linked list' do
      it 'returns the index 3' do
        expect(linked_list.find(300)).to eq(3)
      end
    end

    context 'when the value 400 is not in the linked list' do
      it 'returns nil' do
        expect(linked_list.find(400)).to eq(nil)
      end
    end
  end

  describe '#to_s' do
    context 'when appending 100, 200' do
      context 'when printing linked_list' do
        before do
          linked_list.append(100)
          linked_list.append(200)
        end
      
        it 'returns "( nil ) -> ( 100 ) -> ( 200 ) -> nil"' do
          output = "( nil ) -> ( 100 ) -> ( 200 ) -> nil"
          
          expect(linked_list.to_s).to eq(output)
          expect { puts linked_list }.to output("#{output}\n").to_stdout
        end
      end
    end
  end

  describe '#inspect' do
    context 'when appending 100, 200' do
      context 'when debug printing linked_list' do
        before do
          linked_list.append(100)
          linked_list.append(200)
        end
  
        it 'returns "( nil ) -> ( 100 ) -> ( 200 ) -> nil"' do
          output = "( nil ) -> ( 100 ) -> ( 200 ) -> nil"
  
          expect(linked_list.inspect).to eq(output)
          expect { p linked_list }.to output("#{output}\n").to_stdout
        end
      end
    end
  end

end
