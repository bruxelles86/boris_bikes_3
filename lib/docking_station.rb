require_relative 'bike'

class DockingStation

attr_reader :bikes, :capacity
DEFAULT_CAPACITY = 20

  def initialize(x = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = x
  end

  def dock(bike, condition = nil)
    fail "Capacity is full" if full?
      if condition == "working"
        bike.working = true
      elsif condition == "broken"
        bike.working = false
      end
    @bikes.push(bike)
  end

  def release_bike
    fail 'No bikes available' if empty?
    if @bikes[-1].working?
      @bikes.pop
    else
      fail 'Bike is broken'
    end
  end

  private
  def full?
    @bikes.count == DEFAULT_CAPACITY
  end

  def empty?
    @bikes.count == 0
  end

end
