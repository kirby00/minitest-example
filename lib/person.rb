class Person

  def initialize

  end

  def has_bike?
     @bike
  end

  def take_bike_from(station)
    bike = station.bikes.first
    @bike = station.release_bike(bike)
  end

  def return_bike(station)
    @bike = station << @bike
  end
end