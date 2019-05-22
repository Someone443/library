# frozen_string_literal: true

# Custom statistics displaying
module StatHelper
  def top_readers(app, quantity = 1)
    top_readers = []
    counts = Hash.new { 0 }
    app.orders.each do |order|
      counts[order.reader.email] += 1
    end
    counts.sort_by { |_k, v| v }.reverse.slice(0..(quantity - 1))
          .each { |e| top_readers << e.first }
    top_readers
  end

  def top_books(app, quantity = 1)
    top_books = []
    counts = Hash.new { 0 }
    app.orders.each do |order|
      counts[order.book.title] += 1
    end
    counts.sort_by { |_k, v| v }.reverse.slice(0..(quantity - 1))
          .each { |e| top_books << e.first }
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
