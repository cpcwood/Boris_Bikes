require_relative "docking_station"

class Van
  attr_accessor :broken_bikes, :fixed_bikes
  def pick_broken_bikes(docking_station)
    @broken_bikes = docking_station.van_pick_up
  end

  def drop_broken_bikes(garage)
    garage.van_drop_off(@broken_bikes)
    @broken_bikes = []
  end

  def pick_fixed_bikes(garage)
    @fixed_bikes = garage.van_pick_up
  end

  def drop_fixed_bikes(docking_station)
    docking_station.van_drop_off(@fixed_bikes)
    @fixed_bikes = []
  end
end
