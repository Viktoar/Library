# frozen_string_literal: true

require 'yaml/store'
require_relative 'author'
require_relative 'book'
require_relative 'reader'
require_relative 'order'
require_relative '../modules/uploader'

class Library
  include Uploader
  attr_reader :authors, :books, :readers, :orders

  def initialize
    @authors = []
    @books = []
    @readers = []
    @orders = []
    load
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
