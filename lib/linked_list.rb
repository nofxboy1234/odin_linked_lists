# frozen_string_literal: true

# rubocop:disable Style/TrivialAccessors

require_relative 'node'

class LinkedList
  def initialize
    @list = []
  end

  def list
    @list
  end

  def append(value)
    list.push(Node.new(value))
  end

  def prepend(value)
    list.unshift(Node.new(value))
  end

end
# rubocop:enable Style/TrivialAccessors
