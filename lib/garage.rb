class Garage < Location

  attr_reader :bikes

  DEFAULT_CAPACITY = 20

  # def initialize
  #   @bikes = []
  # end

  # def release_bike(bike)
  #   @bikes.delete bike
  # end

  def check_bike_can_be_accepted(bike)
    super
    raise "Cannot Accept Working bikes" if !bike.broken?
  end

  def fix_bikes!
    @bikes.each{ |bike| fix(bike) }
  end

  def fix bike
    bike.fix!
  end
  # def number_of_bikes
  #   @bikes.length
  # end

  # def bike_included?(bike)
  #   @bikes.include?(bike)
  # end
end
