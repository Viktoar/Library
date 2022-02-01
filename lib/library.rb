require 'yaml/store'
require 'lib/author'
require 'lib/book'
require 'lib/reader'
require 'lib/order'

class Library
  attr_reader :authors, :books, :readers, :orders

  def initialize(file_path = 'yml/library.yml')
    @library = YAML::Store.new(file_path)
    @library.transaction do
      @authors = []
      @books = []
      @readers = []
      @orders = []
    end
  end

  def load
    @library.transaction do
      @authors = @library['authors'] || []
      @books = @library['books'] || []
      @readers = @library['readers'] || []
      @orders = @library['orders'] || []
    end
  end

  def save
    @library.transaction do
      @library['authors'] = @authors
      @library['books'] = @books
      @library['readers'] = @readers
      @library['orders'] = @orders
    end
  end

  def add(entity)
    case entity
    when Author
      @authors.push(entity)
    when Book
      @books.push(entity)
    when Reader
      @readers.push(entity)
    when Order
      @orders.push(entity)
    end
  end

  def top_reader(quantity = 1)
    @orders.group_by(&:reader).sort_by { |_reader, orders| orders.count }.reverse.to_h.keys.first(quantity)
  end

  def most_popular_book(quantity = 1)
    @orders.group_by(&:book).sort_by { |_book, orders| orders.count }.reverse.to_h.keys.first(quantity)
  end

  def number_of_readers_of_the_most_popular_books(quantity = 3)
    most_popular_books = most_popular_book(quantity)
    @orders.map { |order| order.reader.name if most_popular_books.include? order.book }.uniq.compact.count
  end
end
