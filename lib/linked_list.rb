# frozen_string_literal: true

# rubocop:disable Lint/RedundantCopDisableDirective
# rubocop:disable Style/TrivialAccessors

require 'pry-byebug'
require_relative 'node'

class LinkedList
  def append(value)
    increment_size

    tmp = head
    tmp = tmp.next_node while tmp.next_node

    tmp.next_node = create_node(value, nil)
    @tail = tmp.next_node
  end

  def prepend(value)
    increment_size
    @head = create_node(value, head)
  end

  def size
    @size ||= 0
  end

  def head
    @head ||= create_node
  end

  def tail
    @tail ||= head
  end

  def at(index)
    count = 0

    tmp = head
    while tmp.next_node
      tmp = tmp.next_node
      count += 1
      break if count == index
    end

    tmp
  end

  def contains?(value)
    tmp = head
    while tmp.next_node
      tmp = tmp.next_node
      return true if tmp.value == value
    end

    false
  end

  def find(value)
    count = 0

    tmp = head
    while tmp.next_node
      tmp = tmp.next_node
      count += 1
      return count if tmp.value == value
    end

    # tmp.next_node
    nil
  end

  def pop
    # binding.pry
    prev, cur = remove(tail.value)
    @tail = prev
    cur
  end

  
  private

  def remove(value)
    # check if linked list is empty
    raise StandardError, 'Cannot delete. LinkedList is empty!' if head.nil?

    # deleting the head node
    if head.value == value
      @head = head.next_node
      return
    end

    cur = head
    prev = nil

    while cur && cur.value != value
      prev = cur
      cur = cur.next_node
    end
    # check if node is not in the linked list
    raise StandardError, 'Cannot delete. Node is not in the list!' if cur.nil?

    prev.next_node = cur.next_node
    [prev, cur]
  rescue StandardError => e
    puts e
  end

  def create_node(value = nil, next_node = nil)
    Node.new(value, next_node)
  end

  def increment_size
    @size = size + 1 # instead of traversing and counting...
  end
end
# rubocop:enable Style/TrivialAccessors
# rubocop:enable Lint/RedundantCopDisableDirective
