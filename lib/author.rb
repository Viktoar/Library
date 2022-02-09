# frozen_string_literal: true

require 'modules/validation'

class Author
  include Validation
  attr_reader :name, :biography

  def initialize(name:, biography: '')
    validate_str(name, String)
    @name = name
    @biography = biography
  end
end
