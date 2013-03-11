class Location

  DEFAULT_CAPACITY = 10

  def initialize(options = {})
    @bikes = []
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
  end

  def number_of_bikes
    @bikes.length
  end

  def <<(bike) 
    check_bike_can_be_accepted(bike)
    @bikes << bike
  end

  def check_bike_can_be_accepted(bike)
    raise "Bike is already present" if bike_included?(bike)
  end

  def release_bike(bike)
    @bikes.delete bike
  end

  def broken_bikes
    @bikes.select{|bike| bike.broken? }
  end 

  def working_bikes
    @bikes.select{|bike| !bike.broken? }
  end 
  
  def bike_included?(bike)
    @bikes.include?(bike)
  end

  def bikes
    @bikes
  end
end