class Garage
@bikes = []
  def van_pick_up
    bikes_to_return = []
    @bikes.each{|bike|
      if bike.working? == true
        bikes_to_return << bike
      end
    }
    @bikes -= bikes_to_return
    return bikes_to_return
  end

  def van_drop_off(bikes)
    bikes.each {|bike| @bikes.append(bike)}
  end

end
