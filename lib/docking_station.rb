class DockingStation
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise 'No bikes in bike rack' if empty?
    @bikes.each_with_index{|bike, index| return @bikes.slice!(index) if bike.working?}
    raise 'No working bikes in rack'
  end

  def dock_bike(bike:, broken: false)
    raise 'Bike rack is full' if full?
    bike.broken if broken
    @bikes.append(bike)
  end

  def van_pick_up
    bikes_to_return = @bikes.select{|bike| bike.working? == false}
    @bikes -= bikes_to_return
    bikes_to_return
  end

  def van_drop_off(repaired_bikes)
    @bikes += repaired_bikes
  end

  private

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end
