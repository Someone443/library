# frozen_string_literal: true

# Custom statistics displaying
module StatHelper
  def top_readers(app, quantity = 1)
    top_readers = []
    app.orders.group_by { |order| order.reader.email }.values
       .sort_by { |el| el.count }.reverse.slice(0..(quantity - 1))
       .each { |e| top_readers << e.first.reader.name }
    top_readers
  end

  def top_books(app, quantity = 1)
    top_books = []
    app.orders.group_by { |order| order.book.title }.values
       .sort_by { |el| el.count }.reverse.slice(0..(quantity - 1))
       .each { |e| top_books << e.first.book.title }
    top_books
  end

  def top_books_readers_count(app, quantity = 3)
    top_titles = top_books(app, quantity)
    readers = []
    top_titles.each do |top_title|
      app.orders.each do |order|
        readers << order.reader.email if order.book.title.eql?(top_title)
      end
    end
    readers.uniq.count
  end
end
