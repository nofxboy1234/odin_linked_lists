# frozen_string_literal: true

# rubocop:disable Lint/RedundantCopDisableDirective
# rubocop:disable Style/TrivialAccessors

require 'pry-byebug'
require_relative 'node'

class LinkedList
  @current_head = nil

  def append(value)
    increment_size

    if empty?
      self.head = create_node(value, nil)
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
      self.head = create_node(value, nil)
      @tail = head
    else
      self.head = create_node(value, head)
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

  def self.update_current_head(head)
    @current_head = head
  end
  # private_class_method :update_current_head

  def self.current_head
    @current_head
  end

  private

  def head=(value)
    self.class.update_current_head(value)
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

  def decrement_size
    @size = size - 1
  end
end
# rubocop:enable Style/TrivialAccessors
# rubocop:enable Lint/RedundantCopDisableDirective
