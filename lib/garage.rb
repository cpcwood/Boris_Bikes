class Garage
  attr_accessor :bikes
  def initialize
    @bikes = []
  end

  def van_drop_off(broken_bikes)
    broken_bikes.each {|bike| @bikes.append(bike)}
  end

  def fix_bikes
    @bikes.map! {|bike| bike.fixed}
  end

  def van_pick_up
    return @bikes
  end
end
