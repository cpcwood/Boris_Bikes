#require "docking_station"

class Bike
  def initialize
    @working = true
  end
  def working?
    @working
  end
  def broken
    @working = false
  end
  def fixed
    @working = true
  end
end
