class Garage < Location

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike(bike)
    @bikes.delete bike #unless bike.broken? 
  end

  def <<(bike)
    raise "Bike is already present" if bike_included?(bike)
    raise "Cannot Accept Working bikes" if !bike.broken?
    bike.fix!
    @bikes << bike
    
  end

  def number_of_bikes
    @bikes.length
  end

  def bike_included?(bike)
    @bikes.include?(bike)
  end
end
