class Location
  def initialize
    @bikes = []
  end

  def number_of_bikes
    @bikes.length
  end

  def <<(bike) 
    raise "Bike is already present" if bike_included?(bike)
    @bikes << bike
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