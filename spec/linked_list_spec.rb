require './lib/linked_list'

RSpec.describe LinkedList do
  subject(:linked_list) { described_class.new }

  describe '#append', append: true do
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
  end

  describe '#prepend', prepend: true do
    context 'when linked_list is empty' do
      context 'when #prepend is called with a value of 200' do
        let(:prepend200) { linked_list.prepend(200) }

        it 'increases the size of linked_list from 0 to 1' do
          expect { linked_list.prepend(200) }.to change { linked_list.size }.from(0).to(1)
        end

        it 'sets @head to a node with the given value of 200' do
          prepend200
          expect(linked_list.head.value).to eq(200)
        end

        it 'sets @tail to be the same node as @head' do
          prepend200
          expect(linked_list.tail).to be(linked_list.head)
        end
      end
    end

    context 'when linked_list has 1 existing node with a value of 200' do
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

        it 'does not change @tail' do
          expect { linked_list.prepend(300) }.not_to change { linked_list.tail }
        end
      end
    end

    context 'when linked_list has 2 existing nodes with values of 200, 300' do
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

        it 'does not change @tail' do
          expect { linked_list.prepend(400) }.not_to change { linked_list.tail }
        end
      end
    end

    context 'when linked_list has 3 existing nodes with values of 200, 300, 400' do
      context 'when #prepend is called with a value of 500' do
        before do
          linked_list.prepend(200)
          linked_list.prepend(300)
          linked_list.prepend(400)
        end

        it 'increases the size of linked_list from 3 to 4' do
          expect { linked_list.prepend(500) }.to change { linked_list.size }.from(3).to(4)
        end

        it 'sets @head to a node with the given value of 400' do
          linked_list.prepend(500)
          expect(linked_list.head.value).to eq(500)
        end

        it 'does not change @tail' do
          expect { linked_list.prepend(500) }.not_to change { linked_list.tail }
        end
      end
    end
  end

  describe '#size', size: true do
    context 'when linked_list is empty' do
      it 'returns 0' do
        expect(linked_list.size).to eq(0)
      end
    end

    context 'when linked_list is not empty' do
      context 'when 1 node has been appended to the linked_list' do
        let(:append100) { linked_list.append(100) }

        before do
          append100
        end

        it 'returns 1' do
          expect(linked_list.size).to eq(1)
        end
      end

      context 'when 2 nodes have been appended to the linked_list' do
        let(:append100) { linked_list.append(100) }
        let(:append200) { linked_list.append(200) }

        before do
          append100
          append200
        end

        it 'returns 2' do
          expect(linked_list.size).to eq(2)
        end
      end
    end
  end

  describe '#head', head: true do
    context 'when linked_list is empty' do
      it 'is nil' do
        expect(linked_list.head).to be_nil
      end
    end

    context 'when linked_list is not empty' do
      context 'when value 100 is in the list' do
        let(:append100) { linked_list.append(100) }

        before do
          append100
        end

        it 'returns the node with value 100' do
          expect(linked_list.head).to be(append100)
        end
      end

      context 'when values 100, 200 are in the list' do
        let(:append100) { linked_list.append(100) }
        let(:append200) { linked_list.append(200) }

        before do
          append100
          append200
        end

        it 'returns the node with value 100' do
          expect(linked_list.head).to be(append100)
        end
      end

      context 'when values 100, 200, 300 are in the list' do
        let(:append100) { linked_list.append(100) }
        let(:append200) { linked_list.append(200) }
        let(:append300) { linked_list.append(300) }

        before do
          append100
          append200
          append300
        end

        it 'returns the node with value 100' do
          expect(linked_list.head).to be(append100)
        end
      end
    end
  end

  describe '#tail', tail: true do
    context 'when linked_list is empty' do
      it 'is nil' do
        expect(linked_list.tail).to be_nil
      end
    end

    context 'when linked_list is not empty' do
      context 'when value 300 is in the list' do
        let(:append300) { linked_list.append(300) }

        before do
          append300
        end

        it 'returns the node with value 300' do
          expect(linked_list.tail).to be(append300)
        end
      end

      context 'when values 200, 300 are in the list' do
        let(:append200) { linked_list.append(200) }
        let(:append300) { linked_list.append(300) }

        before do
          append200
          append300
        end

        it 'returns the node with value 300' do
          expect(linked_list.tail).to be(append300)
        end
      end

      context 'when values 100, 200, 300 are in the list' do
        let(:append100) { linked_list.append(100) }
        let(:append200) { linked_list.append(200) }
        let(:append300) { linked_list.append(300) }

        before do
          append100
          append200
          append300
        end

        it 'returns the node with value 300' do
          expect(linked_list.tail).to be(append300)
        end
      end
    end
  end

  describe '#at', at: true do
    context 'when linked_list is empty' do
      it 'returns nil' do
        expect(linked_list.at(0)).to be_nil
      end
    end

    context 'when linked_list is not empty' do
      context 'when value 100 is in the list' do
        let(:append100) { linked_list.append(100) }

        before do
          append100
        end

        context 'when the given index is 0' do
          it 'returns the node with value 100' do
            expect(linked_list.at(0)).to be(append100)
          end
        end

        context 'when the given index 3 is not in the list' do
          it 'returns nil' do
            expect(linked_list.at(3)).to be_nil
          end
        end
      end

      context 'when values 100, 200 are in the list' do
        let(:append100) { linked_list.append(100) }
        let(:append200) { linked_list.append(200) }

        before do
          append100
          append200
        end

        context 'when the given index is 0' do
          it 'returns the node with value 100' do
            expect(linked_list.at(0)).to be(append100)
          end
        end

        context 'when the given index is 1' do
          it 'returns the node with value 200' do
            expect(linked_list.at(1)).to be(append200)
          end
        end

        context 'when the given index 3 is not in the list' do
          it 'returns nil' do
            expect(linked_list.at(3)).to be_nil
          end
        end
      end

      context 'when values 100, 200, 300 are in the list' do
        let(:append100) { linked_list.append(100) }
        let(:append200) { linked_list.append(200) }
        let(:append300) { linked_list.append(300) }

        before do
          append100
          append200
          append300
        end

        context 'when the given index is 0' do
          it 'does not send #next_node message to value 100 node' do
            expect(append100).not_to receive(:next_node)
            linked_list.at(0)
          end

          it 'does not send #next_node message to value 200 node' do
            expect(append200).not_to receive(:next_node)
            linked_list.at(0)
          end

          it 'does not send #next_node message to value 300 node' do
            expect(append300).not_to receive(:next_node)
            linked_list.at(0)
          end

          it 'returns the node with value 100' do
            expect(linked_list.at(0)).to be(append100)
          end
        end

        context 'when the given index is 1' do
          it 'sends #next_node message to value 100 node exactly 1 time' do
            expect(append100).to receive(:next_node).exactly(1).time
            linked_list.at(1)
          end

          it 'does not send #next_node message to value 200 node' do
            expect(append200).not_to receive(:next_node)
            linked_list.at(1)
          end

          it 'does not send #next_node message to value 300 node' do
            expect(append300).not_to receive(:next_node)
            linked_list.at(1)
          end

          it 'returns the node with value 200' do
            expect(linked_list.at(1)).to be(append200)
          end
        end

        context 'when the given index is 2' do
          it 'sends #next_node message to value 100 node exactly 1 time' do
            expect(append100).to receive(:next_node).exactly(1).time
            linked_list.at(2)
          end

          it 'sends #next_node message to value 200 node exactly 1 time' do
            expect(append200).to receive(:next_node).exactly(1).time
            linked_list.at(2)
          end

          it 'does not send #next_node message to value 300 node' do
            expect(append300).not_to receive(:next_node)
            linked_list.at(2)
          end

          it 'returns the node with value 300' do
            expect(linked_list.at(2)).to be(append300)
          end
        end

        context 'when the given index 3 is not in the list' do
          it 'sends #next_node message to value 100 node exactly 1 time' do
            expect(append100).to receive(:next_node).exactly(1).time
            linked_list.at(3)
          end

          it 'sends #next_node message to value 200 node exactly 1 time' do
            expect(append200).to receive(:next_node).exactly(1).time
            linked_list.at(3)
          end

          it 'sends #next_node message to value 300 node exactly 1 time' do
            expect(append300).to receive(:next_node).exactly(1).time
            linked_list.at(3)
          end

          it 'returns nil' do
            expect(linked_list.at(3)).to be_nil
          end
        end
      end
    end
  end

  describe '#pop', pop: true  do
    context 'when linked_list is empty' do
      it 'returns nil' do
        expect(linked_list.pop).to eq(nil)
      end
    end

    context 'when linked_list is not empty' do
      let(:append100) { linked_list.append(100) }
      let(:append200) { linked_list.append(200) }
      let(:append300) { linked_list.append(300) }

      before do
        append100
        append200
        append300
      end

      it 'decreases the size of linked_list by 1' do
        expect { linked_list.pop }.to change { linked_list.size }.by(-1)
      end

      it 'sends #value message to @tail exactly 2 times - in #pop and remove#' do
        expect(linked_list.tail).to receive(:value).exactly(2).times
        linked_list.pop
      end

      it 'sets next_node of the new tail node to nil (removes ref to old tail)' do
        linked_list.pop
        expect(append200.next_node).to be_nil
      end

      it 'sets @tail to the new tail node' do
        linked_list.pop
        expect(linked_list.tail).to be(append200)
      end

      it 'returns the old tail node that was removed' do
        expect(linked_list.pop).to be(append300)
      end
    end
  end

  describe '#contains?', contains: true do
    context 'when linked_list is empty' do
      it 'returns false for any value' do
        expect(linked_list.contains?(22)).to eq(false)
      end
    end

    context 'when linked_list is not empty' do
      context 'when value 100 is in the list' do
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

      context 'when values 100, 200 are in the list' do
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
        let(:append100) { linked_list.append(100) }
        let(:append200) { linked_list.append(200) }
        let(:append300) { linked_list.append(300) }

        before do
          append100
          append200
          append300
        end

        context 'when checking if it contains value 100' do
          it 'sends #value message to value 100 node exactly 1 time' do
            expect(append100).to receive(:value).exactly(1).time
            linked_list.contains?(100)
          end

          it 'sends #next_node message to value 100 node exactly 1 time' do
            expect(append100).not_to receive(:next_node)
            linked_list.contains?(100)
          end

          it 'sends #value message to value 200 node exactly 1 time' do
            expect(append200).not_to receive(:value)
            linked_list.contains?(100)
          end

          it 'sends #next_node message to value 200 node' do
            expect(append200).not_to receive(:next_node)
            linked_list.contains?(100)
          end

          it 'sends #value message to value 300 node exactly 1 time' do
            expect(append300).not_to receive(:value)
            linked_list.contains?(100)
          end

          it 'does not send #next_node message to value 300 node' do
            expect(append300).not_to receive(:next_node)
            linked_list.contains?(100)
          end

          it 'returns true' do
            expect(linked_list.contains?(100)).to eq(true)
          end
        end

        context 'when checking if it contains value 200' do
          it 'sends #value message to value 100 node exactly 1 time' do
            expect(append100).to receive(:value).exactly(1).time
            linked_list.contains?(200)
          end

          it 'sends #next_node message to value 100 node exactly 1 time' do
            expect(append100).to receive(:next_node).exactly(1).time
            linked_list.contains?(200)
          end

          it 'sends #value message to value 200 node exactly 1 time' do
            expect(append200).to receive(:value).exactly(1).time
            linked_list.contains?(200)
          end

          it 'sends #next_node message to value 200 node' do
            expect(append200).not_to receive(:next_node)
            linked_list.contains?(200)
          end

          it 'sends #value message to value 300 node exactly 1 time' do
            expect(append300).not_to receive(:value)
            linked_list.contains?(200)
          end

          it 'does not send #next_node message to value 300 node' do
            expect(append300).not_to receive(:next_node)
            linked_list.contains?(200)
          end

          it 'returns true' do
            expect(linked_list.contains?(200)).to eq(true)
          end
        end

        context 'when checking if it contains value 300' do
          it 'sends #value message to value 100 node exactly 1 time' do
            expect(append100).to receive(:value).exactly(1).time
            linked_list.contains?(300)
          end

          it 'sends #next_node message to value 100 node exactly 1 time' do
            expect(append100).to receive(:next_node).exactly(1).time
            linked_list.contains?(300)
          end

          it 'sends #value message to value 200 node exactly 1 time' do
            expect(append200).to receive(:value).exactly(1).time
            linked_list.contains?(300)
          end

          it 'sends #next_node message to value 200 node' do
            expect(append200).to receive(:next_node).exactly(1).time
            linked_list.contains?(300)
          end

          it 'sends #value message to value 300 node exactly 1 time' do
            expect(append300).to receive(:value).exactly(1).time
            linked_list.contains?(300)
          end

          it 'does not send #next_node message to value 300 node' do
            expect(append300).not_to receive(:next_node)
            linked_list.contains?(300)
          end

          it 'returns true' do
            expect(linked_list.contains?(300)).to eq(true)
          end
        end

        context 'when checking if it contains value 400' do
          it 'sends #value message to value 100 node exactly 1 time' do
            expect(append100).to receive(:value).exactly(1).time
            linked_list.contains?(400)
          end

          it 'sends #next_node message to value 100 node exactly 1 time' do
            expect(append100).to receive(:next_node).exactly(1).time
            linked_list.contains?(400)
          end

          it 'sends #value message to value 200 node exactly 1 time' do
            expect(append200).to receive(:value).exactly(1).time
            linked_list.contains?(400)
          end

          it 'sends #next_node message to value 200 node' do
            expect(append200).to receive(:next_node).exactly(1).time
            linked_list.contains?(400)
          end

          it 'sends #value message to value 300 node exactly 1 time' do
            expect(append300).to receive(:value).exactly(1).time
            linked_list.contains?(400)
          end

          it 'does not send #next_node message to value 300 node' do
            expect(append300).to receive(:next_node).exactly(1).time
            linked_list.contains?(400)
          end

          it 'returns false' do
            expect(linked_list.contains?(400)).to eq(false)
          end
        end
      end
    end
  end

  describe '#find', find: true do
    context 'when linked_list is empty' do
      it 'returns nil for any value' do
        expect(linked_list.find(22)).to be_nil
      end
    end

    context 'when linked_list is not empty' do
      context 'when values 100 are in the linked list' do
        let(:append100) { linked_list.append(100) }

        before do
          append100
        end

        context 'when the given value is 100' do
          it 'sends #value message to 100 value node exactly 1 time' do
            expect(append100).to receive(:value).exactly(1).time
            linked_list.find(100)
          end

          it 'does not send #next_node message to 100 value node' do
            expect(append100).not_to receive(:next_node)
            linked_list.find(100)
          end

          it 'returns the index 0' do
            expect(linked_list.find(100)).to eq(0)
          end
        end

        context 'when the given value is 400' do
          it 'sends #value message to 100 value node exactly 1 time' do
            expect(append100).to receive(:value).exactly(1).time
            linked_list.find(400)
          end

          it 'sends #next_node message to 100 value node exactly 1 time' do
            expect(append100).to receive(:next_node).exactly(1).time
            linked_list.find(400)
          end

          it 'returns nil' do
            expect(linked_list.find(400)).to eq(nil)
          end
        end
      end

      context 'when values 100, 200 are in the linked list' do
        let(:append100) { linked_list.append(100) }
        let(:append200) { linked_list.append(200) }

        before do
          append100
          append200
        end

        context 'when the given value is 100' do
          it 'sends #value message to 100 value node exactly 1 time' do
            expect(append100).to receive(:value).exactly(1).time
            linked_list.find(100)
          end

          it 'does not send #next_node message to 100 value node' do
            expect(append100).not_to receive(:next_node)
            linked_list.find(100)
          end

          it 'does not send #value message to 200 value node' do
            expect(append200).not_to receive(:value)
            linked_list.find(100)
          end

          it 'does not send #next_node message to 200 value node' do
            expect(append200).not_to receive(:next_node)
            linked_list.find(100)
          end

          it 'returns the index 0' do
            expect(linked_list.find(100)).to eq(0)
          end
        end

        context 'when the given value is 200' do
          it 'sends #value message to 100 value node exactly 1 time' do
            expect(append100).to receive(:value).exactly(1).time
            linked_list.find(200)
          end

          it 'sends #next_node message to 100 value node exactly 1 time' do
            expect(append100).to receive(:next_node).exactly(1).time
            linked_list.find(200)
          end

          it 'sends #value message to 200 value node exactly 1 time' do
            expect(append200).to receive(:value).exactly(1).time
            linked_list.find(200)
          end

          it 'does not send #next_node message to 200 value node' do
            expect(append200).not_to receive(:next_node)
            linked_list.find(200)
          end

          it 'returns the index 1' do
            expect(linked_list.find(200)).to eq(1)
          end
        end

        context 'when the given value is 400' do
          it 'sends #value message to 100 value node exactly 1 time' do
            expect(append100).to receive(:value).exactly(1).time
            linked_list.find(400)
          end

          it 'sends #next_node message to 100 value node exactly 1 time' do
            expect(append100).to receive(:next_node).exactly(1).time
            linked_list.find(400)
          end

          it 'sends #value message to 200 value node exactly 1 time' do
            expect(append200).to receive(:value).exactly(1).time
            linked_list.find(400)
          end

          it 'sends #next_node message to 200 value node exactly 1 time' do
            expect(append200).to receive(:next_node).exactly(1).time
            linked_list.find(400)
          end

          it 'returns nil' do
            expect(linked_list.find(400)).to eq(nil)
          end
        end
      end

      context 'when values 100, 200, 300 are in the linked list' do
        let(:append100) { linked_list.append(100) }
        let(:append200) { linked_list.append(200) }
        let(:append300) { linked_list.append(300) }

        before do
          append100
          append200
          append300
        end

        context 'when the given value is 100' do
          it 'sends #value message to 100 value node exactly 1 time' do
            expect(append100).to receive(:value).exactly(1).time
            linked_list.find(100)
          end

          it 'does not send #next_node message to 100 value node' do
            expect(append100).not_to receive(:next_node)
            linked_list.find(100)
          end

          it 'does not send #value message to 200 value node' do
            expect(append200).not_to receive(:value)
            linked_list.find(100)
          end

          it 'does not send #next_node message to 200 value node' do
            expect(append200).not_to receive(:next_node)
            linked_list.find(100)
          end

          it 'does not send #value message to 300 value node' do
            expect(append300).not_to receive(:value)
            linked_list.find(100)
          end

          it 'does not send #next_node message to 300 value node' do
            expect(append300).not_to receive(:next_node)
            linked_list.find(100)
          end

          it 'returns the index 0' do
            expect(linked_list.find(100)).to eq(0)
          end
        end

        context 'when the given value is 200' do
          it 'sends #value message to 100 value node exactly 1 time' do
            expect(append100).to receive(:value).exactly(1).time
            linked_list.find(200)
          end

          it 'sends #next_node message to 100 value node exactly 1 time' do
            expect(append100).to receive(:next_node).exactly(1).time
            linked_list.find(200)
          end

          it 'sends #value message to 200 value node exactly 1 time' do
            expect(append200).to receive(:value).exactly(1).time
            linked_list.find(200)
          end

          it 'does not send #next_node message to 200 value node' do
            expect(append200).not_to receive(:next_node)
            linked_list.find(200)
          end

          it 'does not send #value message to 300 value node' do
            expect(append300).not_to receive(:value)
            linked_list.find(200)
          end

          it 'does not send #next_node message to 300 value node' do
            expect(append300).not_to receive(:next_node)
            linked_list.find(200)
          end

          it 'returns the index 1' do
            expect(linked_list.find(200)).to eq(1)
          end
        end

        context 'when the given value is 300' do
          it 'sends #value message to 100 value node exactly 1 time' do
            expect(append100).to receive(:value).exactly(1).time
            linked_list.find(300)
          end

          it 'sends #next_node message to 100 value node exactly 1 time' do
            expect(append100).to receive(:next_node).exactly(1).time
            linked_list.find(300)
          end

          it 'sends #value message to 200 value node exactly 1 time' do
            expect(append200).to receive(:value).exactly(1).time
            linked_list.find(300)
          end

          it 'sends #next_node message to 200 value node exactly 1 time' do
            expect(append200).to receive(:next_node).exactly(1).time
            linked_list.find(300)
          end

          it 'sends #value message to 300 value node exactly 1 time' do
            expect(append300).to receive(:value).exactly(1).time
            linked_list.find(300)
          end

          it 'does not send #next_node message to 300 value node' do
            expect(append300).not_to receive(:next_node)
            linked_list.find(300)
          end

          it 'returns the index 2' do
            expect(linked_list.find(300)).to eq(2)
          end
        end

        context 'when the given value is 400' do
          it 'sends #value message to 100 value node exactly 1 time' do
            expect(append100).to receive(:value).exactly(1).time
            linked_list.find(400)
          end

          it 'sends #next_node message to 100 value node exactly 1 time' do
            expect(append100).to receive(:next_node).exactly(1).time
            linked_list.find(400)
          end

          it 'sends #value message to 200 value node exactly 1 time' do
            expect(append200).to receive(:value).exactly(1).time
            linked_list.find(400)
          end

          it 'sends #next_node message to 200 value node exactly 1 time' do
            expect(append200).to receive(:next_node).exactly(1).time
            linked_list.find(400)
          end

          it 'sends #value message to 300 value node exactly 1 time' do
            expect(append300).to receive(:value).exactly(1).time
            linked_list.find(400)
          end

          it 'sends #next_node message to 300 value node exactly 1 time' do
            expect(append300).to receive(:next_node)
            linked_list.find(400)
          end

          it 'returns nil' do
            expect(linked_list.find(400)).to eq(nil)
          end
        end
      end
    end
  end

  describe '#to_s', to_s: true do
    context 'when the list is empty' do
      it 'returns an empty string' do
        expect(linked_list.to_s).to eq('(  ) -> nil')
        expect { puts linked_list }.to output("(  ) -> nil\n").to_stdout
      end
    end

    context 'when the list has 100 in it' do
      let(:append100) { linked_list.append(100) }

      before do
        append100
      end

      it 'sends #value message to node value 100 exactly 1 time' do
        expect(append100).to receive(:value).exactly(1).time
        linked_list.to_s
      end

      it 'sends #next_node message to node value 100 exactly 1 time' do
        expect(append100).to receive(:next_node).exactly(1).time
        linked_list.to_s
      end

      it 'returns "( 100 ) -> nil"' do
        output = '( 100 ) -> nil'

        expect(linked_list.to_s).to eq(output)
        expect { puts linked_list }.to output("#{output}\n").to_stdout
      end
    end

    context 'when the list has 100, 200 in it' do
      let(:append100) { linked_list.append(100) }
      let(:append200) { linked_list.append(200) }

      before do
        append100
        append200
      end

      it 'sends #value message to node value 100 exactly 1 time' do
        expect(append100).to receive(:value).exactly(1).time
        linked_list.to_s
      end

      it 'sends #next_node message to node value 100 exactly 1 time' do
        expect(append100).to receive(:next_node).exactly(1).time
        linked_list.to_s
      end

      it 'sends #value message to node value 200 exactly 1 time' do
        expect(append200).to receive(:value).exactly(1).time
        linked_list.to_s
      end

      it 'sends #next_node message to node value 200 exactly 1 time' do
        expect(append200).to receive(:next_node).exactly(1).time
        linked_list.to_s
      end

      it 'returns "( 100 ) -> ( 200 ) -> nil"' do
        output = '( 100 ) -> ( 200 ) -> nil'

        expect(linked_list.to_s).to eq(output)
        expect { puts linked_list }.to output("#{output}\n").to_stdout
      end
    end

    context 'when the list has 100, 200, 300 in it' do
      let(:append100) { linked_list.append(100) }
      let(:append200) { linked_list.append(200) }
      let(:append300) { linked_list.append(300) }

      before do
        append100
        append200
        append300
      end

      it 'sends #value message to node value 100 exactly 1 time' do
        expect(append100).to receive(:value).exactly(1).time
        linked_list.to_s
      end

      it 'sends #next_node message to node value 100 exactly 1 time' do
        expect(append100).to receive(:next_node).exactly(1).time
        linked_list.to_s
      end

      it 'sends #value message to node value 200 exactly 1 time' do
        expect(append200).to receive(:value).exactly(1).time
        linked_list.to_s
      end

      it 'sends #next_node message to node value 200 exactly 1 time' do
        expect(append200).to receive(:next_node).exactly(1).time
        linked_list.to_s
      end

      it 'sends #value message to node value 300 exactly 1 time' do
        expect(append300).to receive(:value).exactly(1).time
        linked_list.to_s
      end

      it 'sends #next_node message to node value 300 exactly 1 time' do
        expect(append300).to receive(:next_node).exactly(1).time
        linked_list.to_s
      end

      it 'returns "( 100 ) -> ( 200 ) -> ( 300 ) -> nil"' do
        output = '( 100 ) -> ( 200 ) -> ( 300 ) -> nil'

        expect(linked_list.to_s).to eq(output)
        expect { puts linked_list }.to output("#{output}\n").to_stdout
      end
    end
  end

  describe '#remove', remove: true do
    context 'when the linked list is empty' do
      it 'returns nil' do
        expect(linked_list.remove(100)).to eq(nil)
      end
    end

    context 'when the value 100 is in the list' do
      let(:append100) { linked_list.append(100) }

      before do
        append100
      end

      context 'when the value to remove is value 100 node (head)' do
        it 'sends #value message to @head exactly 1 time' do
          expect(linked_list.head).to receive(:value).and_call_original.exactly(1).time
          linked_list.remove(100)
        end

        it 'sends #next_node message to value 100 node exactly 1 time' do
          expect(append100).to receive(:next_node).exactly(1).time
          linked_list.remove(100)
        end

        it 'changes the the value of @head to nil' do
          expect { linked_list.remove(100) }.to change { linked_list.head }
            .from(append100).to(nil)
        end

        it 'returns [value_100_node, value_100_node]' do
          expect(linked_list.remove(100)).to eq([append100, append100])
        end

        it 'does not send #find_with_previous message to linked_list' do
          expect(linked_list).not_to receive(:find_with_previous)
          linked_list.remove(100)
        end

        it 'decreases the size of linked list by 1' do
          expect { linked_list.remove(100) }.to change { linked_list.size }
            .from(1).to(0)
        end
      end

      context 'when the value to remove is 400' do
        it 'sends #value message to @head exactly 1 time' do
          expect(linked_list.head).to receive(:value).and_call_original.exactly(1).time
          linked_list.remove(100)
        end

        it 'returns nil' do
          expect(linked_list.remove(400)).to eq(nil)
        end
      end
    end

    context 'when the values 100, 200 are in the list' do
      let(:append100) { linked_list.append(100) }
      let(:append200) { linked_list.append(200) }

      before do
        append100
        append200
      end

      context 'when the value to remove is value 100 node (head)' do
        it 'sends #value message to @head exactly 1 time' do
          expect(linked_list.head).to receive(:value).and_call_original.exactly(1).time
          linked_list.remove(100)
        end

        it 'sends #next_node message to value 100 node exactly 1 time' do
          expect(append100).to receive(:next_node).exactly(1).time
          linked_list.remove(100)
        end

        it 'changes the the value of @head to value 200 node' do
          expect { linked_list.remove(100) }.to change { linked_list.head }
            .from(append100).to(append200)
        end

        it 'returns [value_100_node, value_100_node]' do
          expect(linked_list.remove(100)).to eq([append100, append100])
        end

        it 'does not send #find_with_previous message to linked_list' do
          expect(linked_list).not_to receive(:find_with_previous)
          linked_list.remove(100)
        end

        it 'decreases the size of linked list by 1' do
          expect { linked_list.remove(100) }.to change { linked_list.size }
            .from(2).to(1)
        end
      end

      context 'when the value to remove is 200' do
        it 'sends #value message to @head exactly 2 times' do
          expect(linked_list.head).to receive(:value).and_call_original.exactly(2).times
          linked_list.remove(200)
        end

        it 'sends #next_node message to value 200 node exactly 1 time' do
          expect(append200).to receive(:next_node).exactly(1).time
          linked_list.remove(200)
        end

        it 'sends #next_node= message to value 100 node exactly 1 time' do
          expect(append100).to receive(:next_node=).exactly(1).time
          linked_list.remove(200)
        end

        it "changes value 100 node's next_node from value 200 node to nil" do
          linked_list.remove(200)
          expect(append100.next_node).to eq(nil)
        end

        it 'returns [value_100_node, value_200_node]' do
          expect(linked_list.remove(200)).to eq([append100, append200])
        end

        it 'decreases the size of linked list by 1' do
          expect { linked_list.remove(200) }.to change { linked_list.size }
            .from(2).to(1)
        end
      end

      context 'when the value to remove is 400' do
        it 'sends #value message to @head exactly 2 times' do
          expect(linked_list.head).to receive(:value).and_call_original.exactly(2).times
          linked_list.remove(400)
        end

        it 'returns nil' do
          expect(linked_list.remove(400)).to eq(nil)
        end
      end
    end
  end

  describe '#insert_at', insert_at: true do
    describe 'inserts a new node with the provided value at the given index' do
      context 'when linked list is empty' do
        let(:new_node) { double('new_node') }
        let(:insert_at_99) { linked_list.insert_at(100, 99) }
        let(:insert_at_0) { linked_list.insert_at(700, 0) }
        let(:insert_at_1) { linked_list.insert_at(700, 1) }

        before do
          allow(linked_list).to receive(:create_node).and_return(new_node)
        end

        it 'increases size of linked list by 1' do
          expect { insert_at_99 }
            .to change { linked_list.size }.from(0).to(1)
        end

        context 'when inserting at index 99' do
          it 'has inserted new node at index 0' do
            insert_at_99
            expect(insert_at_99.at(0)).to be(new_node)
          end
        end

        context 'when inserting at index 0' do
          it 'has inserted new node at index 0' do
            insert_at_0
            expect(insert_at_0.at(0)).to be(new_node)
          end
        end

        context 'when inserting at index 1' do
          it 'has inserted new node at index 0' do
            insert_at_1
            expect(insert_at_1.at(0)).to be(new_node)
          end
        end
      end

      context 'when linked list has values 100, 200' do
        let(:append100) { linked_list.append(100) }
        let(:append200) { linked_list.append(200) }
        let(:new_node) { double('new_node') }
        let(:insert_at_99) { linked_list.insert_at(700, 99) }
        let(:insert_at_0) { linked_list.insert_at(700, 0) }
        let(:insert_at_1) { linked_list.insert_at(700, 1) }

        before do
          append100
          append200
          allow(linked_list).to receive(:create_node).and_return(new_node)
        end

        context 'when index >= linked list size' do
          it 'increases size of linked list by 1' do
            expect { insert_at_99 }
              .to change { linked_list.size }.from(2).to(3)
          end

          context 'when inserting at index 99' do
            it 'has inserted new node at tail' do
              insert_at_99
              expect(insert_at_99.tail).to be(new_node)
            end
          end
        end

        context 'when inserting at index zero' do
          it 'increases size of linked list by 1' do
            expect { insert_at_0 }
              .to change { linked_list.size }.from(2).to(3)
          end

          it 'has inserted new node at index 0' do
            insert_at_0
            expect(insert_at_0.at(0)).to be(new_node)
          end
        end

        context 'when index > 0 and index < linked list size' do
          context 'when inserting at index 1' do
            it 'increases size of linked list by 1' do
              expect { insert_at_1 }
                .to change { linked_list.size }.from(2).to(3)
            end
  
            it 'has inserted new node at index 1' do
              insert_at_1
              expect(insert_at_1.at(1)).to be(new_node)
            end
          end
        end
      end
    end
  end
end
