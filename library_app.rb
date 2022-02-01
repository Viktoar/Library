require 'lib/library'

library = Library.new

john = Author.new(name: 'John')
meg = Author.new(name: 'Meg')
donna = Author.new(name: 'Donna')

ring = Book.new(title: 'Ring', author: john)
fly = Book.new(title: 'Fly', author: meg)
boat = Book.new(title: 'Boat', author: donna)

ken = Reader.new(name: 'Ken', email: 'ken@email', city: 'NY', street: 'croosroad', house: 1)
chak = Reader.new(name: 'Chak', email: 'chak@email', city: 'NY', street: 'croosroad', house: 2)
bob = Reader.new(name: 'Bob', email: 'bob@email', city: 'NY', street: 'croosroad', house: 3)

library.add(john)
library.add(meg)
library.add(donna)
library.add(ring)
library.add(fly)
library.add(ken)
library.add(chak)
library.add(bob)
library.add(Order.new(book: ring, reader: ken))
library.add(Order.new(book: fly, reader: ken))
library.add(Order.new(book: ring, reader: chak))
library.add(Order.new(book: ring, reader: bob))
library.add(Order.new(book: fly, reader: bob))
library.add(Order.new(book: boat, reader: bob))

puts library.top_reader
puts library.most_popular_book
puts library.number_of_readers_of_the_most_popular_books
