require 'modules/validation'

class Book
  include Validation
  attr_reader :title, :author

  def initialize(title:, author:)
    validate({ title => String, author => Author })
    @title = title
    @author = author
  end
end
