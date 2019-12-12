require_relative "docking_station"

class Van
  attr_accessor :broken_bikes, :fixed_bikes
  def initialize
    @broken_bikes = []
    @fixed_bikes = []
  end

  def pick_broken_bikes(docking_station)
    bikes = docking_station.van_pick_up
    bikes.each {|bike| @broken_bikes.append(bike)}
  end

  def drop_broken_bikes(garage)
    garage.van_drop_off(@broken_bikes)
    @broken_bikes = []
  end

  def pick_fixed_bikes(garage)
    bikes = garage.van_pick_up
    bikes.each {|bike| @fixed_bikes.append(bike)}
  end

  def drop_fixed_bikes(docking_station)
    docking_station.van_drop_off(@fixed_bikes)
    @fixed_bikes = []
  end
end
