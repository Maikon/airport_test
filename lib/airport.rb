class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 15

  def initialize(options = {})
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @planes = []
  end

  def land(plane)
    planes << plane
  end

  def take_off(plane)
    planes.delete(plane)
  end

end