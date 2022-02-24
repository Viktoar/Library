# frozen_string_literal: true

require_relative '../errors/error_class_type'
require_relative '../errors/error_empty_string'
require_relative '../errors/error_positive_value'

module Validation
  private

  def validate_str(variable, class_type)
    validate_class(variable, class_type)
    validate_empty_string(variable)
  end

  def validate_int(variable, class_type)
    validate_class(variable, class_type)
    validate_integer_value(variable)
  end

  def validate_class(variable, class_type)
    raise ErrorClassType unless variable.is_a?(class_type)
  end

  def validate_empty_string(string)
    raise ErrorEmptyString if string.strip.empty?
  end

  def validate_integer_value(integer)
    raise ErrorPositiveValue unless integer.positive?
  end
end
