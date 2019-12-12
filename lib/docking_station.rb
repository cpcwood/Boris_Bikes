require_relative "bike"

class DockingStation
  attr_accessor :bikes
  attr_reader :capacity
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    if empty?
      raise 'No bikes in bike rack'
    else
    @bikes.each{|bike|
      if bike.working? == true
        return bike
      end
    }
    raise 'No working bikes in rack'
    end
  end

  def dock_bike(bike, broken = false)
    if full?
       raise 'Bike rack is full'
    else
      if broken == true
        bike.broken
      end
      @bikes.append(bike)
      "bike docked"
    end
  end

  private

  def full?
    if @bikes.count >= @capacity
      true
    else
      false
    end
  end

  def empty?
    if @bikes.empty?
      true
    else
      false
    end
  end
end
