class ErrorClassType < StandardError
  def initialize(msg = 'Wrong class of object')
    super
  end
end
