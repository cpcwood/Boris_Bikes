require_relative 'DockingStation'

class Van
  def pick_bike_bikes(docking_station)
    @broken_bikes = docking_station.van_pick_up
  end

  def drop_off_bikes(garage)
    garage.drop_off(@broken_bikes)
  end
end
