# frozen_string_literal: true

# rubocop:disable Style/TrivialAccessors

require_relative 'node'

class LinkedList
  # def initialize
  #   @head = Node.new
  # end
  
  # def append(value)
  #   # if head.nil?

  #   # end
  #   head.value = value
  # end
  
  def prepend(value)
    @head = create_node(value)
  end
  
  # def size
  #   head.size
  # end
  
  def head
    @head ||= create_node
  end

  private

  def create_node(value = nil)
    Node.new(value)
  end
end
# rubocop:enable Style/TrivialAccessors
