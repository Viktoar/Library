# frozen_string_literal: true

require 'date'
require 'modules/validation'

class Order
  include Validation
  attr_reader :book, :reader, :date

  def initialize(book:, reader:, date: Date.today)
    validate_class(book, Book)
    validate_class(reader, Reader)
    validate_class(date, Date)
    @book = book
    @reader = reader
    @date = date
  end
end
