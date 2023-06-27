# frozen_string_literal: true

# rubocop:disable Lint/RedundantCopDisableDirective
# rubocop:disable Style/TrivialAccessors

require 'pry-byebug'
require_relative 'node'

class LinkedList
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
    count = 0
    tmp = head
    while tmp && count != index
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
    tmp = head
    while tmp
      value_found = tmp.value == value
      return true if value_found

      tmp = tmp.next_node
    end

    false
  end

  def find(value)
    count = 0
    tmp = head
    while tmp
      value_found = tmp.value == value
      return count if value_found

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
    @size = size + 1
  end

  def decrement_size
    @size = size - 1
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

  def setup_last(value)
    new_tail_node = create_node(value, nil)

    tail.next_node = new_tail_node
    @tail = tail.next_node
  end
end
# rubocop:enable Style/TrivialAccessors
# rubocop:enable Lint/RedundantCopDisableDirective
