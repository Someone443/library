# frozen_string_literal: true

# The library contains the next entities: Authors, Books, Readers, and Orders.
class Book < Entity
  attr_reader :title, :author

  def initialize(title, author)
    validate(title, author)

    @title = title
    @author = author
  end

  def to_s
    "Title: #{title}. Author: #{author}."
  end

  def validate(title, author)
    not_empty_string(title)
    valid_class(author, Author)
  end
end
