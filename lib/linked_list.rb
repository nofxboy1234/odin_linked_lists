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

  private

  def create_node(value = nil, next_node = nil)
    Node.new(value, next_node)
  end

  def increment_size
    @size = size + 1 # instead of traversing and counting...
  end
end
# rubocop:enable Style/TrivialAccessors
# rubocop:enable Lint/RedundantCopDisableDirective
