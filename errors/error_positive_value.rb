# frozen_string_literal: true

class ErrorPositiveValue < StandardError
  def initialize(msg = 'Expected positive value')
    super
  end
end
