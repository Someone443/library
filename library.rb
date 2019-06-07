# frozen_string_literal: true

require './config/setup.rb'

# Main Library class
class Library
  include DbHelper
  include StatHelper

  ENTITIES = { author: Author, book: Book, reader: Reader, order: Order }.freeze

  attr_reader :books, :authors, :readers, :orders

  def initialize
    load_library
  end

  def new_entity(type, *params)
    entity = ENTITIES.fetch(type).new(*params)
    storage = public_send("#{type}s")
    storage << entity unless exists?(entity, storage)
    save("#{type}s", storage)
    entity
  end

  def load_library
    @books = load('books')
    @authors = load('authors')
    @readers = load('readers')
    @orders = load('orders')
  end

  def save_library
    ENTITIES.each_key do |entity|
      save("#{entity}s", public_send("#{entity}s"))
    end
  end
end
