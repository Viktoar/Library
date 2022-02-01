require 'errors/error_class_type'
require 'errors/error_empty_string'
require 'errors/error_positive_value'

module Validation
  def validate(variables)
    variables.each do |variable, class_type|
      validate_class(variable, class_type)

      case variable
      when Integer
        validate_integer_value(variable)
      when String
        validate_empty_string(variable)
      end
    end
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
