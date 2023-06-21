# frozen_string_literal: true

# rubocop:disable Lint/RedundantCopDisableDirective
# rubocop:disable Style/TrivialAccessors

require 'pry-byebug'
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
    # size += 1 # Error
    # size = size + 1 # Error

    # self.size += 1 # Error
    # self.size = 1 # Error

    # @size += 1 # Error

    # a = size + 1
    # @size = a
    
    # self.size = self.size + 1
    # self.size = size + 1
    # self.size += 1

    @size = size + 1

    @head = create_node(value)
  end

  def size
    # head.size
    @size ||= 0
  end

  def head
    @head ||= create_node
  end

  private

  # def size=(value)
  #   @size = value
  # end

  def create_node(value = nil)
    Node.new(value)
  end
end
# rubocop:enable Style/TrivialAccessors
# rubocop:enable Lint/RedundantCopDisableDirective
