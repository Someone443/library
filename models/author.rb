# frozen_string_literal: true

# The library contains the next entities: Authors, Books, Readers, and Orders.
class Author
  attr_reader :name, :bio

  def initialize(name, bio = '')
    raise ValidationError if name == '' || !(name.is_a? String)

    @name = name
    @bio = bio
  end

  def to_s
    "Name: #{name}.\n Biography: #{bio}"
  end
end
