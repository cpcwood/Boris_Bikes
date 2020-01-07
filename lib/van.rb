class Van
  def initialize
    @bikes = []
  end

  def pick_up_bikes(location)
    @bikes += location.van_pick_up
  end

  def drop_bikes(location:, working:)
    selected = @bikes.select{|bike| bike.working? == working}
    @bikes -= selected
    raise 'No bikes to drop' if selected.empty?
    location.van_drop_off(selected)
  end
end
