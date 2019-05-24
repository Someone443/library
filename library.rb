# frozen_string_literal: true

require './models/book.rb'
require './models/author.rb'
require './models/reader.rb'
require './models/order.rb'
require './helpers/db_helper.rb'
require './helpers/stat_helper.rb'
require './helpers/errors/validation_error.rb'
require 'yaml'
require 'date'

# Main Library class
class Library
  include DbHelper
  include StatHelper

  attr_reader :books, :authors, :readers, :orders

  def initialize
    load_library
  end

  def new_book(title, author)
    book = Book.new(title, author)
    @books << book unless exists?(book, @books)
    save('books', self)
    book
  end

  def new_author(name, bio = '')
    author = Author.new(name, bio)
    @authors << author unless exists?(author, @authors)
    save('authors', self)
    author
  end

  def new_reader(name, email, city, street, house)
    reader = Reader.new(name, email, city, street, house)
    @readers << reader unless exists?(reader, @readers)
    save('readers', self)
    reader
  end

  def new_order(book, reader, date = Date.today)
    order = Order.new(book, reader, date)
    @orders << order unless exists?(order, @orders)
    save('orders', self)
    order
  end

  def load_library
    @books = load('books') || []
    @authors = load('authors') || []
    @readers = load('readers') || []
    @orders = load('orders') || []
  end

  def save_library
    save('authors', self)
    save('books', self)
    save('readers', self)
    save('orders', self)
  end
end
