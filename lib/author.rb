# frozen_string_literal: true

require_relative '../modules/validation'

class Author
  include Validation
  attr_reader :name, :biography

  def initialize(name:, biography: nil)
    validate_str(name, String)
    @name = name
    @biography = biography
  end
end
