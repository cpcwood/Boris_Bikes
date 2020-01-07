class Garage
  def initialize
    @bikes = []
  end

  def van_drop_off(broken_bikes)
    @bikes += broken_bikes
  end

  def fix_bikes
    @bikes.each {|bike| bike.fixed}
  end

  def van_pick_up
    bikes_to_return = @bikes.select{|bike| bike.working?}
    @bikes -= bikes_to_return
    bikes_to_return
  end
end
