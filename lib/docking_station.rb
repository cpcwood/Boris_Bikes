require_relative "bike"

class DockingStation
  attr_reader :bikes
  DEFAULT_CAPACITY = 20
  def initialize
    @bikes = []
    @bikes.append(Bike.new)
  end
  def release_bike
    if empty?
      raise
    else
    Bike.new
    end
  end
  def dock_bike(bike)
    if full?
       raise
    else
       true
    end
  end

  private

  def full?
    if @bikes.count >= DEFAULT_CAPACITY
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



 #docking_station = DockingStation.new
 #docking_station.bikes.clear
 #bike = docking_station.release_bike

 # docking_station.dock_bike(bike)
