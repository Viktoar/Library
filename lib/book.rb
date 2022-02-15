# frozen_string_literal: true

require_relative '../modules/validation'

class Book
  include Validation
  attr_reader :title, :author

  def initialize(title:, author:)
    validate_str(title, String)
    validate_class(author, Author)
    @title = title
    @author = author
  end
end
