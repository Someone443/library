# frozen_string_literal: true

# Custom statistics displaying
module StatHelper
  def top_readers(orders, quantity = 1)
    orders.group_by(&:reader).values
          .sort_by { |items| -items.count }
          .first(quantity)
          .map { |order| order.first.reader.name }
  end

  def top_books(orders, quantity = 1)
    orders.group_by(&:book).values
          .sort_by { |items| -items.count }
          .first(quantity)
          .map { |order| order.first.book.title }
  end

  def top_books_readers_count(orders, quantity = 3)
    top_titles = top_books(orders, quantity)
    readers = []
    top_titles.each do |top_title|
      orders.each do |order|
        readers << order.reader.email if order.book.title.eql?(top_title)
      end
    end
    readers.uniq.count
  end
end
