# frozen_string_literal: true

class ErrorClassType < StandardError
  def initialize(msg = 'Wrong class of object')
    super
  end
end
