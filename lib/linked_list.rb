# frozen_string_literal: true

# rubocop:disable Lint/RedundantCopDisableDirective
# rubocop:disable Style/TrivialAccessors

require 'pry-byebug'
require_relative 'node'

# LinkedList manages values stored in Nodes
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
    current_node = head
    while current_node && count != index
      current_node = current_node.next_node
      count += 1
    end

    current_node
  end

  def pop
    return nil if empty?

    previous_node, current_node = remove(tail.value)
    @tail = previous_node
    current_node
  end

  def contains?(value)
    current_node = head
    while current_node
      value_found = current_node.value == value
      return true if value_found

      current_node = current_node.next_node
    end

    false
  end

  def find(value)
    count = 0
    current_node = head
    while current_node
      value_found = current_node.value == value
      return count if value_found

      current_node = current_node.next_node
      count += 1
    end

    current_node
  end

  def to_s
    return '(  ) -> nil' if empty?

    values = []
    current_node = @head
    while current_node
      values.push(current_node.value || 'nil')
      current_node = current_node.next_node
    end

    values.push('nil')
    nodes_string(values)
  end

  def inspect
    to_s
  end

  def remove_at(index)
    node = at(index)
    remove(node.value) if node
  end

  def remove(value)
    return nil if empty?

    # deleting the head node
    if head.value == value

      old_head = head
      self.head = head.next_node
      decrement_size
      @tail = head if [0, 1].include?(size)

      return [old_head, old_head]
    end

    previous_node, current_node = find_with_previous(value)
    return nil unless current_node

    decrement_size
    @tail = previous_node if tail.value == value

    previous_node.next_node = current_node.next_node
    [previous_node, current_node]
  end

  def insert_at(value, index)
    if empty?
      append(value)
      # append(create_node(value))
    elsif index >= size
      append(value)
      # append(create_node(value))
    elsif index.zero?
      prepend(value)
    else
      increment_size

      current_node = head
      count = 0
      while current_node
        if count == index - 1
          new_node = create_node(value, current_node.next_node)
          current_node.next_node = new_node
          break
        end

        current_node = current_node.next_node
        count += 1
      end
    end
    self
  end

  private

  def head=(value)
    @head = value
  end

  def empty?
    head.nil?
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
    values.each_with_index.inject('') do |memo, operand|
      op = operand[0]
      index = operand[1]
      index_is_last = op == values.last

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

  def find_with_previous(value)
    count = 0
    previous_node = nil
    current_node = head

    while current_node
      value_found = current_node.value == value
      return [previous_node, current_node] if value_found

      previous_node = current_node
      current_node = current_node.next_node
      count += 1
    end

    [previous_node, current_node]
  end
end
# rubocop:enable Style/TrivialAccessors
# rubocop:enable Lint/RedundantCopDisableDirective
