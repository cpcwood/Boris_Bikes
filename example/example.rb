require '../lib/bike.rb'
require '../lib/docking_station.rb'
require '../lib/garage.rb'
require '../lib/van.rb'

docking_station = DockingStation.new
small_station = DockingStation.new(1)
van = Van.new
bike = Bike.new
garage = Garage.new

# Test capacity
puts 'Test docking station capacity'
small_station.dock_bike(bike: bike)
begin
  small_station.dock_bike(bike: bike)
rescue => e
  puts "  Error: #{e}"
end

#Test release
puts "\nDocking and releasing bike"
docking_station.dock_bike(bike: bike)
p docking_station.release_bike
puts "Attempt to release bike when none in rack"
begin
  docking_station.release_bike
rescue => e
  puts "  Error: #{e}"
end

#Test adding broken bike
puts "\nAdding broken bike"
docking_station.dock_bike(bike: bike, broken: true)
puts 'Tring to release broken bike'
begin
  docking_station.release_bike
rescue => e
  puts "  Error: #{e}"
end

#Test picking up broken bikes
puts 'Pick up broken bike'
van.pick_up_bikes(docking_station)
puts 'Drop off broken bikes'
van.drop_bikes(location: garage, working: false)
puts 'Fix bikes'
garage.fix_bikes
puts 'Pick up fixed bike from garage'
van.pick_up_bikes(garage)
puts 'Drop off fixed bike at statiob'
van.drop_bikes(location: docking_station, working: true)
puts 'Release bike from docking station'
p docking_station.release_bike
puts 'Try to van drop off when none in van'
begin
  van.drop_bikes(location: docking_station, working: true)
rescue => e
  puts "  Error: #{e}"
end
