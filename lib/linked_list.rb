# frozen_string_literal: true

# rubocop:disable Lint/RedundantCopDisableDirective
# rubocop:disable Style/TrivialAccessors

require 'pry-byebug'
require_relative 'node'

class LinkedList
  def append(value)
    increment_size

    if empty?
      @head = create_node(value, nil)
      @tail = head
    else
      tmp = head
      tmp = tmp.next_node while tmp.next_node

      tmp.next_node = create_node(value, nil)
      @tail = tmp.next_node
    end
  end

  def prepend(value)
    increment_size

    if empty?
      @head = create_node(value, nil)
      @tail = head
    else
      @head = create_node(value, head)
    end
  end

  def size
    @size ||= 0
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    return nil if empty?

    count = 0
    tmp = head
    while tmp.next_node
      break if count == index

      tmp = tmp.next_node
      count += 1
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
    prev, cur = remove(tail.value)
    @tail = prev
    cur
  end

  def to_s
    values = []

    tmp = head
    while tmp
      values.push(tmp.value || 'nil')

      tmp = tmp.next_node
      values.push('nil') if tmp.nil?
    end

    values.each_with_index.inject('') do |memo, operand|
      op = operand[0]
      index = operand[1]

      str = if index == values.size - 1
              memo + "#{op}"
            else
              memo + "( #{op} )"
            end

      str += ' -> ' unless index == values.size - 1

      str
    end
  end

  def inspect
    to_s
  end

  private

  def empty?
    head.nil?
  end

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
