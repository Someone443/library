# frozen_string_literal: true

# The library contains the next entities: Authors, Books, Readers, and Orders.
class Author < Entity
  attr_reader :name, :bio

  def initialize(name, bio = '')
    validate(name, bio)

    @name = name
    @bio = bio
  end

  def to_s
    "Name: #{name}.\n Biography: #{bio}"
  end

  def validate(name, bio = '')
    not_empty_string(name)
  end
end
