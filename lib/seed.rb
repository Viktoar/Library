# frozen_string_literal: true

require 'faker'

class Seed
  def initialize(library, count = 5)
    new_authors(library, count)
    new_readers(library, count)
    new_books(library, count)
    new_orders(library, count)
  end

  def new_authors(library, count)
    (1..count).each do |_i|
      library.add(Author.new(name: Faker::Name.name))
    end
  end

  def new_books(library, count)
    (1..count).each do |_i|
      title = Faker::Book.title
      author = library.authors[rand(library.authors.count)]
      library.add(Book.new(title: title, author: author))
    end
  end

  def new_readers(library, count)
    (1..count).each do |_i|
      name = Faker::Name.name
      email = Faker::Internet.email(name: name)
      city = Faker::Address.city
      street = Faker::Address.street_name
      house = Faker::Address.building_number.to_i
      library.add(Reader.new(name: name, email: email, city: city, street: street, house: house))
    end
  end

  def new_orders(library, count)
    (1..count).each do |_i|
      book = library.books[rand(library.books.count)]
      reader = library.readers[rand(library.readers.count)]
      library.add(Order.new(book: book, reader: reader))
    end
  end
end
