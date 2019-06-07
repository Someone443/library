# frozen_string_literal: true

# The library contains the next entities: Authors, Books, Readers, and Orders.
class Order < Entity
  attr_reader :book, :reader, :date

  def initialize(book, reader, date = Date.today)
    validate(book, reader, date)

    @book = book
    @reader = reader
    @date = date
  end

  def to_s
    "Book: #{book}. Reader: #{reader}. Date: #{date}."
  end

  def validate(book, reader, date)
    valid_class(book, Book)
    valid_class(reader, Reader)
    valid_class(date, Date)
  end
end
