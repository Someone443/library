# frozen_string_literal: true

require './library.rb'

lib = Library.new

author1 = lib.new_entity(:author, 'Ivan Kotliarevsky', 'Ukrainian writer, poet and '\
                         'playwright, regarded as the pioneer '\
                         'of modern Ukrainian literature.')
author2 = lib.new_entity(:author, 'Dan Brown', 'Dan Gerhard Brown was born '\
                         'on June 22, 1964, in Exeter, New Hampshire.')

book1 = lib.new_entity(:book, 'Eneyida', author1)
book2 = lib.new_entity(:book, 'The Da Vinci Code', author2)
book3 = lib.new_entity(:book, 'Natalka Poltavka', author1)
book4 = lib.new_entity(:book, 'Angels & Demons', author2)

reader1 = lib.new_entity(:reader, name: 'Steven Strange', email: 'drstrange@test.com',
                                  city: 'New York', street: 'Baker St.', house: 107)
reader2 = lib.new_entity(:reader, name: 'Alex J', email: 'alexj@test.com',
                                  city: 'Orlando', street: 'West Str.', house: 111)
reader3 = lib.new_entity(:reader, name: 'Harrison Ford', email: 'hford@test.com',
                                  city: 'Toronto', street: 'Green Str.', house: 151)
reader4 = lib.new_entity(:reader, name: 'Orlando Bloom', email: 'bloom@test.com',
                                  city: 'Toronto', street: 'Yellow Str.', house: 122)

order1 = lib.new_entity(:order, book1, reader1, Date.new(2019, 5, 21))
order2 = lib.new_entity(:order, book2, reader1)
order3 = lib.new_entity(:order, book1, reader2)
order4 = lib.new_entity(:order, book3, reader3)
order5 = lib.new_entity(:order, book4, reader1)
order6 = lib.new_entity(:order, book3, reader4)

lib.save_library

puts '--- TOP READERS ---'
puts lib.top_readers(lib.orders, 3)
puts '---'
puts '--- TOP BOOKS ---'
puts lib.top_books(lib.orders, 3)
puts '---'
puts '--- TOP BOOKS READERS COUNT ---'
puts lib.top_books_readers_count(lib.orders, 2)
puts '---'
