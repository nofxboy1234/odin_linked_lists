require 'pry-byebug'

# frozen_string_literal: true

class Node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def value
    @value
  end

  def next_node
    # binding.pry
    @next_node
  end
end
