class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(options = {})
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @planes = []
  end

  def land(plane)
    raise "Airport is full I'm afraid!" if full?
    planes << plane
  end

  def take_off(plane)
    planes.delete(plane)
  end

  def full?
    planes.count >= capacity
  end

end