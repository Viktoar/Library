require 'modules/validation'

class Reader
  include Validation
  attr_reader :name, :email, :city, :street, :house

  def initialize(name:, email:, city:, street:, house:)
    validate({ name => String, email => String, city => String, street => String, house => Integer })
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end
end
