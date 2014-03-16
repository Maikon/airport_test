require_relative 'weather'

class Airport
  include Weather
  attr_reader :capacity
  attr_accessor :planes

  def initialize(capacity = 6)
    @capacity = capacity
    @planes = []
  end

  def parks(plane)
    raise 'Aiport is full!' if full?
    raise 'Stormy weather, cannot allow landing.' if weather_stormy?
    @planes << plane
    plane.land
  end

  def release(plane)
    raise 'Stormy weather, not advisable to fly.' if weather_stormy?
    @planes.delete(plane)
    plane.take_off
  end

  def full?
    @planes.length == @capacity
  end
end
