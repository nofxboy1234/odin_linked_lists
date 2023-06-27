# frozen_string_literal: true

# rubocop:disable Lint/RedundantCopDisableDirective
# rubocop:disable Style/TrivialAccessors

require 'pry-byebug'
require_relative 'node'

class LinkedList
  # rubocop:disable Style/WhileUntilModifier
  def append(value)
    increment_size
    tail_node = create_node(value, nil)

    if empty?
      self.head = tail_node
      @tail = head
    else
      setup_last(value)
    end
  end
  # rubocop:enable Style/WhileUntilModifier

  def prepend(value)
    increment_size

    if empty?
      tail_node = create_node(value, nil)
      self.head = tail_node
      @tail = head
    else
      self.head = create_node(value, head)
    end
  end

  def size
    @size ||= 0
  end

  def head
    @head ||= nil
  end

  def tail
    @tail ||= nil
  end

  def at(index)
    return nil if empty?

    count = 0
    tmp = head
    while tmp
      break if count == index

      tmp = tmp.next_node
      count += 1
    end

    tmp
  end

  def pop
    return nil if empty?

    decrement_size

    prev, cur = remove(tail.value)
    @tail = prev
    cur
  end

  def contains?(value)
    return false if empty?

    tmp = head
    while tmp
      return true if tmp.value == value

      tmp = tmp.next_node
    end

    false
  end

  def find(value)
    return nil if empty?

    count = 0
    tmp = head
    while tmp
      return count if tmp.value == value

      tmp = tmp.next_node
      count += 1
    end

    tmp
  end

  def to_s
    return '' if empty?

    values = []
    tmp = head
    while tmp
      values.push(tmp.value || 'nil')
      tmp = tmp.next_node
    end

    values.push('nil')
    nodes_string(values)
  end

  def inspect
    to_s
  end

  def setup_last(value)
    last_node = last
    tail_node = create_node(value, nil)
    last_node.next_node = tail_node
    @tail = last_node.next_node
  end

  private

  def head=(value)
    @head = value
  end

  def empty?
    head.nil?
  end

  def remove(value)
    # check if linked list is empty
    raise StandardError, 'Cannot delete. LinkedList is empty!' if head.nil?

    # deleting the head node
    if head.value == value
      self.head = head.next_node
      return
    end

    current_node = head
    previous_node = nil

    while current_node && current_node.value != value
      previous_node = current_node
      current_node = current_node.next_node
    end
    # check if node is not in the linked list
    raise StandardError, 'Cannot delete. Node is not in the list!' if current_node.nil?

    previous_node.next_node = current_node.next_node
    [previous_node, current_node]
  rescue StandardError => e
    puts e
  end

  def create_node(value = nil, next_node = nil)
    Node.new(value, next_node)
  end

  def increment_size
    @size = size + 1 # instead of traversing and counting...
  end

  def decrement_size
    @size = size - 1
  end

  def last
    return nil if empty?

    current_node = head
    current_node = current_node.next_node while current_node.next_node
    current_node
  end

  def nodes_string(values)
    last_index = values.size - 1

    values.each_with_index.inject('') do |memo, operand|
      op = operand[0]
      index = operand[1]
      index_is_last = index == last_index

      str = if index_is_last
              memo + op.to_s
            else
              memo + "( #{op} )"
            end

      str += ' -> ' unless index_is_last
      str
    end
  end
end
# rubocop:enable Style/TrivialAccessors
# rubocop:enable Lint/RedundantCopDisableDirective
