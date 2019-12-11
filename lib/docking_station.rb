require_relative "bike"

class DockingStation
  attr_reader :bikes
  attr_reader :capacity
  def initialize
    @bikes = []
    @bikes.append(Bike.new)
    @capacity = 20
  end
  def release_bike
    if @bikes.empty?
      raise
    else
    Bike.new
    end
 end
  def dock_bike(bike)
    if @bikes.count >= @capacity
       raise
     else
       true
     end

  end
end



 #docking_station = DockingStation.new
 #docking_station.bikes.clear
 #bike = docking_station.release_bike

 # docking_station.dock_bike(bike)
