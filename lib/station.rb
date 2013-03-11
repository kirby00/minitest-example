class Station < Location

  DEFAULT_CAPACITY = 10

  def initialize(options = {})
    @bikes = []
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
  end
  
  def <<(bike)
    raise "Station full" if at_capacity?
    # raise "Bike is already present" if bike_included?(bike)
    # @bikes << bike
    super(bike)
  end  

  def at_capacity?
    number_of_bikes == @capacity
  end

  # def bikes
  #   @bikes
  # end

  # def number_of_bikes
  #   @bikes.length
  # end

  # def release_bike(bike)
  #   @bikes.delete bike
  # end

  # def broken_bikes
  #   @bikes.select{|bike| bike.broken? }
  # end 

  # def working_bikes
  #   @bikes.select{|bike| !bike.broken? }
  # end 

  # def bike_included?(bike)
  #   @bikes.include?(bike)
  # end
end
