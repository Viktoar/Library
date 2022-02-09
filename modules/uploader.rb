# frozen_string_literal: true

module Uploader
  PATH = 'yml/library.yml'
  def load
    @library = YAML::Store.new(PATH)
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
end
