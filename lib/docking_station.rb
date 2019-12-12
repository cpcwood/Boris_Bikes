# require_relative "bike"
# require_relative "van"
# require_relative "garage"

class DockingStation
  attr_accessor :bikes
  attr_reader :capacity
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    if empty?
      raise 'No bikes in bike rack'
    else
    @bikes.each_with_index{|bike, index|
      if bike.working? == true
        return @bikes.slice!(index)
      end
    }
    raise 'No working bikes in rack'
    end
  end

  def van_pick_up
    bikes_to_return = []
    @bikes.each{|bike|
      if bike.working? == false
        bikes_to_return << bike
      end
    }
    @bikes -= bikes_to_return
    return bikes_to_return
  end

  def van_drop_off(bikes)
    bikes.each {|bike| @bikes.append(bike)}
  end

  def dock_bike(bike, broken = false)
    if full?
       raise 'Bike rack is full'
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
