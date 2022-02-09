# frozen_string_literal: true

require 'lib/library'
require 'lib/seed'

library = Library.new
Seed.new(library)

library.save

puts library.top_reader
puts library.most_popular_book
puts library.number_of_readers_of_the_most_popular_books
