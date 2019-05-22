# frozen_string_literal: true

# The library contains the next entities: Authors, Books, Readers, and Orders.
class Order
  attr_reader :book, :reader, :date

  def initialize(book, reader, date = Date.today)
    if !(book.is_a? Book) || !(reader.is_a? Reader) || !(date.is_a? Date)
      raise ValidationError
    end

    @book = book
    @reader = reader
    @date = date
  end

  def to_s
    "Book: #{book}. Reader: #{reader}. Date: #{date}."
  end
end
