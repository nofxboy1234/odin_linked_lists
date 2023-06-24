# frozen_string_literal: true

# rubocop:disable Lint/RedundantCopDisableDirective
# rubocop:disable Style/TrivialAccessors

require 'pry-byebug'

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
    # if LinkedList.current_head.equal?(self)
    #   p 'next_node called on head---------------------'
    # else
    #   p 'next_node------------------------'
    # end

    # puts "next_node called on #{value}"

    @next_node
  end

  def next_node=(node)
    # puts "next_node= called on #{value}"
    @next_node = node
  end
end
# rubocop:enable Style/TrivialAccessors
# rubocop:enable Lint/RedundantCopDisableDirective
