require_relative 'bike'

class DockingStation

attr_reader :bike, :capacity
DEFAULT_CAPACITY = 20

  def initialize(x = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = x
  end

  def dock(bike)
    fail 'Capacity is full' if full?
    @bikes.push(bike)
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  private
  def full?
    @bikes.count == DEFAULT_CAPACITY
  end

  def empty?
    @bikes.count == 0
  end

end
