# frozen_string_literal: true

require './library.rb'

lib = Library.new

author1 = lib.new_author('Ivan Kotliarevsky', 'Ukrainian writer, poet and '\
                         'playwright, regarded as the pioneer '\
                         'of modern Ukrainian literature.')
author2 = lib.new_author('Dan Brown', 'Dan Gerhard Brown was born '\
                         'on June 22, 1964, in Exeter, New Hampshire.')

book1 = lib.new_book('Eneyida', author1)
book2 = lib.new_book('The Da Vinci Code', author2)
book3 = lib.new_book('Natalka Poltavka', author1)
book4 = lib.new_book('Angels & Demons', author2)

reader1 = lib.new_reader('Steven Strange', 'drstrange@test.com',
                         'New York', 'Baker St.', 107)
reader2 = lib.new_reader('Alex J', 'alexj@test.com',
                         'Orlando', 'West Str.', 111)
reader3 = lib.new_reader('Harrison Ford', 'hford@test.com',
                         'Toronto', 'Green Str.', 151)
reader4 = lib.new_reader('Orlando Bloom', 'bloom@test.com',
                         'Toronto', 'Yellow Str.', 122)

order1 = lib.new_order(book1, reader1, Date.new(2019, 5, 21))
order2 = lib.new_order(book2, reader1)
order3 = lib.new_order(book1, reader2)
order4 = lib.new_order(book3, reader3)
order5 = lib.new_order(book4, reader1)
order6 = lib.new_order(book3, reader4)

lib.save_library

puts '--- TOP READERS ---'
puts lib.top_readers(lib, 3)
puts '---'
puts '--- TOP BOOKS ---'
puts lib.top_books(lib, 3)
puts '---'
puts '--- TOP BOOKS READERS COUNT ---'
puts lib.top_books_readers_count(lib, 2)
puts '---'
