require './lib/linked_list'

RSpec.describe LinkedList do
  subject(:linked_list) { described_class.new }

  describe '#append' do
    context 'when linked_list is empty' do
      context 'when #append is called with a value of 200' do
        it 'increases the size of linked_list from 0 to 1' do
          expect { linked_list.append(200) }.to change { linked_list.size }.from(0).to(1)
        end

        it 'sets @head to a node with the given value of 200' do
          linked_list.append(200)
          expect(linked_list.head.value).to eq(200)
        end

        it 'sets @tail to be the same node as @head' do
          linked_list.append(200)
          expect(linked_list.tail).to be(linked_list.head)
        end
      end
    end

    context 'when linked_list has 1 existing node (the head) with a value of 200' do
      context 'when #append is called with a value of 300' do
        before do
          linked_list.append(200)
        end

        it 'increases the size of linked_list from 1 to 2' do
          expect { linked_list.append(300) }.to change { linked_list.size }.from(1).to(2)
        end

        it 'does not change @head' do
          expect { linked_list.append(300) }.not_to change { linked_list.head }
        end

        it 'sets @tail to a node with the given value of 300' do
          linked_list.append(300)
          expect(linked_list.tail.value).to eq(300)
        end

        it 'sends #next_node message to @head exactly 2 times (1 time in while loop condition, 1 time when updating @tail)' do
          expect(linked_list.head).to receive(:next_node).exactly(2).times
          linked_list.append(300)
        end

        it 'sends #next_node= message to the last node @head (the head and tail) exactly 1 time' do
          expect(linked_list.head).to receive(:next_node=).exactly(1).time
          linked_list.append(300)
        end
      end
    end

    context 'when linked_list has 2 existing nodes (1 head and 1 tail) with values of 200, 300' do
      context 'when #append is called with a value of 400' do
        before do
          linked_list.append(200)
          linked_list.append(300)
        end

        it 'increases the size of linked_list from 2 to 3' do
          expect { linked_list.append(400) }.to change { linked_list.size }.from(2).to(3)
        end

        it 'does not change @head' do
          expect { linked_list.append(400) }.not_to change { linked_list.head }
        end

        it 'sets @tail to a node with the given value of 400' do
          linked_list.append(400)
          expect(linked_list.tail.value).to eq(400)
        end

        it 'sends #next_node message to @head exactly 2 times (1 time in while loop condition, 1 time in while loop body, 0 times when updating @tail)' do
          expect(linked_list.head).to receive(:next_node).exactly(2).times
          linked_list.append(400)
        end
      end
    end
  end

  describe '#prepend' do
    context 'when linked_list is empty' do
      context 'when #prepend is called with a value of 200' do
        it 'increases the size of linked_list from 0 to 1' do
          expect { linked_list.prepend(200) }.to change { linked_list.size }.from(0).to(1)
        end

        it 'sets @head to a node with the given value of 200' do
          linked_list.prepend(200)
          expect(linked_list.head.value).to eq(200)
        end

        it 'sets @tail to be the same node as @head' do
          linked_list.prepend(200)
          expect(linked_list.tail).to be(linked_list.head)
        end
      end
    end

    context 'when linked_list has 1 existing node (the head) with a value of 200' do
      context 'when #prepend is called with a value of 300' do
        before do
          linked_list.prepend(200)
        end

        it 'increases the size of linked_list from 1 to 2' do
          expect { linked_list.prepend(300) }.to change { linked_list.size }.from(1).to(2)
        end

        it 'sets @head to a node with the given value of 300' do
          linked_list.prepend(300)
          expect(linked_list.head.value).to eq(300)
        end
      end
    end

    context 'when linked_list has 2 existing nodes (1 head and 1 tail) with values of 200, 300' do
      context 'when #prepend is called with a value of 400' do
        before do
          linked_list.prepend(200)
          linked_list.prepend(300)
        end

        it 'increases the size of linked_list from 2 to 3' do
          expect { linked_list.prepend(400) }.to change { linked_list.size }.from(2).to(3)
        end

        it 'sets @head to a node with the given value of 400' do
          linked_list.prepend(400)
          expect(linked_list.head.value).to eq(400)
        end
      end
    end
  end

  describe '#size' do
    context 'when linked_list is empty' do
      it 'returns 0' do
        expect(linked_list.size).to eq(0)
      end
    end

    context 'when 1 node has been appended to the linked_list' do
      it 'returns 1' do
        linked_list.append(300)
        expect(linked_list.size).to eq(1)
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
      it 'is nil' do
        expect(linked_list.head).to be_nil
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
      it 'is nil' do
        expect(linked_list.tail).to be_nil
      end
    end

    context 'when linked_list is not empty' do
      it 'returns the last node' do
        last_node = linked_list.append(400)
        expect(linked_list.tail).to be(last_node)
      end

      it 'has next_node set to nil' do
        last_node = linked_list.append(400)
        expect(linked_list.tail.next_node).to be_nil
      end
    end
  end

  describe '#at' do
    context 'when linked_list is empty' do
      it 'returns nil' do
        expect(linked_list.at(0)).to be_nil
      end
    end

    context 'when linked_list is not empty' do
      context 'when 3 nodes of values 100, 200, 300 are appended to the empty linked_list' do
        context 'when the given index is 0' do
          it 'returns the node at index 0 (head node)' do
            appended_node100 = linked_list.append(100)
            linked_list.append(200)
            linked_list.append(300)

            expect(linked_list.at(0)).to be(appended_node100)
          end
        end

        context 'when the given index is 1' do
          it 'returns the node at index 1' do
            linked_list.append(100)
            appended_node200 = linked_list.append(200)
            linked_list.append(300)

            expect(linked_list.at(1)).to be(appended_node200)
          end
        end

        context 'when the given index is 2' do
          it 'returns the node at index 2 (tail node)' do
            linked_list.append(100)
            linked_list.append(200)
            appended_node300 = linked_list.append(300)

            expect(linked_list.at(2)).to be(appended_node300)
          end
        end
      end
    end
  end

  describe '#pop' do
    context 'when linked_list is empty' do
      it 'returns nil' do
        expect(linked_list.pop).to eq(nil)
      end
    end

    context 'when linked_list is not empty' do
      it 'sets @tail to the new tail node' do
        linked_list.append(100)
        new_tail = linked_list.append(200)
        linked_list.append(300)

        linked_list.pop
        expect(linked_list.tail).to be(new_tail)
      end

      it 'sets next_node of the new tail node to nil' do
        linked_list.append(100)
        new_tail = linked_list.append(200)
        linked_list.append(300)

        linked_list.pop
        expect(new_tail.next_node).to be_nil
      end

      it 'returns the old tail node that was removed' do
        linked_list.append(100)
        linked_list.append(200)
        old_tail = linked_list.append(300)

        expect(linked_list.pop).to be(old_tail)
      end
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
          output = '( nil ) -> ( 100 ) -> ( 200 ) -> nil'

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
          output = '( nil ) -> ( 100 ) -> ( 200 ) -> nil'

          expect(linked_list.inspect).to eq(output)
          expect { p linked_list }.to output("#{output}\n").to_stdout
        end
      end
    end
  end
end
