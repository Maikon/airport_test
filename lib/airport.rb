class Airport
  attr_accessor :capacity
  DEFAULT_CAPACITY = 10

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
  end

end