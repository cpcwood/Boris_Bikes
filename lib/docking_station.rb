require_relative "bike"

class DockingStation
  attr_reader :bikes
  attr_reader :capacity
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @bikes.append(Bike.new)
    @capacity = capacity
  end
  def release_bike
    if empty?
      raise
    else
    Bike.new
    end
  end
  def dock_bike(bike, broken = false)
    if full?
       raise
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




=begin
 docking_station = DockingStation.new
 puts docking_station.capacity
 docking_station2 = DockingStation.new(5)
 puts docking_station2.capacity
=end
