require 'date'
require 'modules/validation'

class Order
  include Validation
  attr_reader :book, :reader, :date

  def initialize(book:, reader:, date: Date.today)
    validate({ book => Book, reader => Reader, date => Date })
    @book = book
    @reader = reader
    @date = date
  end
end
