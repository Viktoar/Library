class ErrorPositiveValue < StandardError
  def initialize(msg = 'Expected positive value')
    super
  end
end
