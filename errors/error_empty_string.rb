class ErrorEmptyString < StandardError
  def initialize(msg = 'Expected not empty string')
    super
  end
end
