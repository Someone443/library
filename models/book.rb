# frozen_string_literal: true

# The library contains the next entities: Authors, Books, Readers, and Orders.
class Book
  attr_reader :title, :author

  def initialize(title, author)
    if title == '' || !(title.is_a? String) || !(author.is_a? Author)
      raise ValidationError
    end

    @title = title
    @author = author
  end

  def to_s
    "Title: #{title}. Author: #{author}."
  end
end
