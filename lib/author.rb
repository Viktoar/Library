require 'modules/validation'

class Author
  include Validation
  attr_reader :name, :biography

  def initialize(name:, biography: '')
    validate({ name => String })
    @name = name
    @biography = biography
  end
end
