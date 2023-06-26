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

        it 'never sends #next_node message to any instance of Node' do
          expect_any_instance_of(Node).to receive(:next_node).never
          linked_list.append(200)
        end
      end
    end

    context 'when linked_list has 1 existing node with a value of 200' do
      context 'when #append is called with a value of 300' do
        let(:append200) { linked_list.append(200) }

        before do
          append200
        end

        it 'increases the size of linked_list from 1 to 2' do
          expect { linked_list.append(300) }.to change { linked_list.size }.from(1).to(2)
        end

        it 'does not change @head' do
          expect { linked_list.append(300) }.not_to change { linked_list.head }
        end

        it 'sends #next_node message to value 200 node exactly 2 times' do
          expect(append200).to receive(:next_node).exactly(2).times
          linked_list.append(300)
        end

        it 'sends #next_node= message to value 200 node exactly 1 time' do
          expect(append200).to receive(:next_node=).exactly(1).time
          linked_list.append(300)
        end

        it 'sets @tail to a node with the given value of 300' do
          linked_list.append(300)
          expect(linked_list.tail.value).to eq(300)
        end
      end
    end

    context 'when linked_list has 2 existing nodes with values of 200, 300' do
      context 'when #append is called with a value of 400' do
        let(:append200) { linked_list.append(200) }
        let(:append300) { linked_list.append(300) }

        before do
          append200
          append300
        end

        it 'increases the size of linked_list from 2 to 3' do
          expect { linked_list.append(400) }.to change { linked_list.size }.from(2).to(3)
        end

        it 'does not change @head' do
          expect { linked_list.append(400) }.not_to change { linked_list.head }
        end

        it 'sends #next_node message to value 200 node exactly 2 times' do
          expect(append200).to receive(:next_node).exactly(2).times
          linked_list.append(400)
        end

        it 'sends #next_node message to value 300 node exactly 2 times' do
          expect(append300).to receive(:next_node).exactly(2).times
          linked_list.append(400)
        end

        it 'sends #next_node= message to value 300 node exactly 1 time' do
          expect(append300).to receive(:next_node=).exactly(1).time
          linked_list.append(400)
        end

        it 'sets @tail to a node with the given value of 400' do
          linked_list.append(400)
          expect(linked_list.tail.value).to eq(400)
        end
      end
    end

    context 'when linked_list has 3 existing nodes with values of 200, 300, 400' do
      context 'when #append is called with a value of 500' do
        let(:append200) { linked_list.append(200) }
        let(:append300) { linked_list.append(300) }
        let(:append400) { linked_list.append(400) }
  
        before do
          append200
          append300
          append400
        end
  
        it 'increases the size of linked_list from 3 to 4' do
          expect { linked_list.append(500) }.to change { linked_list.size }.from(3).to(4)
        end
  
        it 'does not change @head' do
          expect { linked_list.append(500) }.not_to change { linked_list.head }
        end
  
        it 'sends #next_node message to value 200 node exactly 2 times' do
          expect(append200).to receive(:next_node).exactly(2).times
          linked_list.append(500)
        end
  
        it 'sends #next_node message to value 300 node exactly 2 times' do
          expect(append300).to receive(:next_node).exactly(2).times
          linked_list.append(500)
        end
  
        it 'sends #next_node message to value 400 node exactly 2 times' do
          expect(append400).to receive(:next_node).exactly(2).times
          linked_list.append(500)
        end
  
        it 'sends #next_node= message to value 400 node exactly 1 time' do
          expect(append400).to receive(:next_node=).exactly(1).time
          linked_list.append(500)
        end
  
        it 'sets @tail to a node with the given value of 500' do
          linked_list.append(500)
          expect(linked_list.tail.value).to eq(500)
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

    context 'when linked_list is not empty' do
      context 'when 1 node has been appended to the linked_list' do
        it 'returns 1' do
          linked_list.append(300)
          expect(linked_list.size).to eq(1)
        end
      end

      context 'when 2 nodes have been appended to the linked_list' do
        it 'returns 1' do
          linked_list.append(300)
          linked_list.append(400)
          expect(linked_list.size).to eq(2)
        end
      end

      context 'when 1 node has been prepended to the linked_list' do
        it 'returns 1' do
          linked_list.prepend(300)
          expect(linked_list.size).to eq(1)
        end
      end

      context 'when 2 nodes have been prepended to the linked_list' do
        it 'returns 1' do
          linked_list.prepend(400)
          linked_list.prepend(300)
          expect(linked_list.size).to eq(2)
        end
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
      context 'when value 100 is in the list' do
        it 'returns the node with value 100' do
          first_node = linked_list.append(100)
          expect(linked_list.head).to be(first_node)
        end
      end

      context 'when values 100, 200 are in the list' do
        it 'returns the node with value 100' do
          first_node = linked_list.append(100)
          linked_list.append(200)
          expect(linked_list.head).to be(first_node)
        end
      end

      context 'when values 100, 200, 300 are in the list' do
        it 'returns the node with value 100' do
          first_node = linked_list.append(100)
          linked_list.append(200)
          linked_list.append(300)
          expect(linked_list.head).to be(first_node)
        end
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
      context 'when value 300 is in the list' do
        it 'returns the node with value 300' do
          last_node = linked_list.append(300)
          expect(linked_list.tail).to be(last_node)
        end
      end

      context 'when values 200, 300 are in the list' do
        it 'returns the node with value 300' do
          linked_list.append(200)
          last_node = linked_list.append(300)
          expect(linked_list.tail).to be(last_node)
        end
      end

      context 'when values 100, 200, 300 are in the list' do
        it 'returns the node with value 300' do
          linked_list.append(100)
          linked_list.append(200)
          last_node = linked_list.append(300)
          expect(linked_list.tail).to be(last_node)
        end
      end

      # it 'has next_node of the tail (last node) set to nil' do
      #   linked_list.append(100)
      #   expect(linked_list.tail.next_node).to be_nil
      # end
    end
  end

  describe '#at' do
    context 'when linked_list is empty' do
      it 'returns nil' do
        expect(linked_list.at(0)).to be_nil
      end
    end

    context 'when linked_list is not empty' do
      context 'when value 100 is in the list' do
        context 'when the given index is 0' do
          it 'returns the node with value 100 (head and tail node)' do
            appended_node100 = linked_list.append(100)

            expect(linked_list.at(0)).to be(appended_node100)
          end
        end

        context 'when index 3 is not in the list' do
          it 'returns nil' do
            linked_list.append(100)

            expect(linked_list.at(3)).to be_nil
          end
        end
      end

      context 'when values 100, 200 are in the list' do
        context 'when the given index is 0' do
          it 'returns the node with value 100 (head node)' do
            appended_node100 = linked_list.append(100)
            linked_list.append(200)

            expect(linked_list.at(0)).to be(appended_node100)
          end
        end

        context 'when the given index is 1' do
          it 'returns the node with value 200 (tail node)' do
            linked_list.append(100)
            appended_node200 = linked_list.append(200)

            expect(linked_list.at(1)).to be(appended_node200)
          end
        end

        context 'when index 3 is not in the list' do
          it 'returns nil' do
            linked_list.append(100)
            linked_list.append(200)

            expect(linked_list.at(3)).to be_nil
          end
        end
      end

      context 'when values 100, 200, 300 are in the list' do
        context 'when the given index is 0' do
          it 'returns the node with value 100 (head node)' do
            appended_node100 = linked_list.append(100)
            linked_list.append(200)
            linked_list.append(300)

            expect(linked_list.at(0)).to be(appended_node100)
          end
        end

        context 'when the given index is 1' do
          it 'returns the node with value 200' do
            linked_list.append(100)
            appended_node200 = linked_list.append(200)
            linked_list.append(300)

            expect(linked_list.at(1)).to be(appended_node200)
          end
        end

        context 'when the given index is 2' do
          it 'returns the node with value 300 (tail node)' do
            linked_list.append(100)
            linked_list.append(200)
            appended_node300 = linked_list.append(300)

            expect(linked_list.at(2)).to be(appended_node300)
          end
        end

        context 'when index 3 is not in the list' do
          it 'returns nil' do
            linked_list.append(100)
            linked_list.append(200)
            linked_list.append(300)

            expect(linked_list.at(3)).to be_nil
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
      it 'decreases the size of linked_list by 1' do
        linked_list.append(100)
        linked_list.append(200)
        linked_list.append(300)

        expect { linked_list.pop }.to change { linked_list.size }.by(-1)
      end

      # it 'sets next_node of the new tail node to nil' do
      #   linked_list.append(100)
      #   new_tail = linked_list.append(200)
      #   linked_list.append(300)

      #   linked_list.pop
      #   expect(new_tail.next_node).to be_nil
      # end

      it 'sets @tail to the new tail node' do
        linked_list.append(100)
        new_tail = linked_list.append(200)
        linked_list.append(300)

        linked_list.pop
        expect(linked_list.tail).to be(new_tail)
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
    context 'when linked_list is empty' do
      it 'returns false for any value' do
        expect(linked_list.contains?(22)).to eq(false)
      end
    end

    context 'when linked_list is not empty' do
      context 'when the value 100 is in the linked list' do
        before do
          linked_list.append(100)
        end

        context 'when checking if it contains value 100' do
          it 'returns true' do
            expect(linked_list.contains?(100)).to eq(true)
          end
        end

        context 'when checking if it contains value 400' do
          it 'returns false' do
            expect(linked_list.contains?(400)).to eq(false)
          end
        end
      end

      context 'when values 100, 200 are in the linked list' do
        before do
          linked_list.append(100)
          linked_list.append(200)
        end

        context 'when checking if it contains value 100' do
          it 'returns true' do
            expect(linked_list.contains?(100)).to eq(true)
          end
        end

        context 'when checking if it contains value 200' do
          it 'returns true' do
            expect(linked_list.contains?(200)).to eq(true)
          end
        end

        context 'when checking if it contains value 400' do
          it 'returns false' do
            expect(linked_list.contains?(400)).to eq(false)
          end
        end
      end

      context 'when values 100, 200, 300 are in the linked list' do
        before do
          linked_list.append(100)
          linked_list.append(200)
          linked_list.append(300)
        end

        context 'when checking if it contains value 100' do
          it 'returns true' do
            expect(linked_list.contains?(100)).to eq(true)
          end
        end

        context 'when checking if it contains value 200' do
          it 'returns true' do
            expect(linked_list.contains?(200)).to eq(true)
          end
        end

        context 'when checking if it contains value 300' do
          it 'returns true' do
            expect(linked_list.contains?(300)).to eq(true)
          end
        end

        context 'when checking if it contains value 400' do
          it 'returns false' do
            expect(linked_list.contains?(400)).to eq(false)
          end
        end
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
