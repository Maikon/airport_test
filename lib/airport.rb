class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(options = {})
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @planes = []
  end

  def land(plane)
    raise "Airport is full I'm afraid!" if full?
    # You have two tests failing because stormy_weather? doesn't exist
    # Where is it supposed to be defined?g
    raise "Stormy and dangerous weather, cannot land now." if stormy_weather?
    planes << plane
  end

  def take_off(plane)
    planes.delete(plane)
  end

  def full?
    planes.count >= capacity
  end

end