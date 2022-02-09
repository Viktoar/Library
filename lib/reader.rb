# frozen_string_literal: true

require 'modules/validation'

class Reader
  include Validation
  attr_reader :name, :email, :city, :street, :house

  def initialize(name:, email:, city:, street:, house:)
    validate_str(name, String)
    validate_str(email, String)
    validate_str(city, String)
    validate_str(street, String)
    validate_int(house, Integer)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end
end
