require './lib/location' # the class under test
require './lib/garage' 
require './lib/van' 
require './lib/person' 
require './lib/station' 
require './lib/bike'
require 'minitest/autorun' # the minitest itself
require 'ansi' # makes it colored
require 'turn' # improves the default output

class TestLocation < MiniTest::Unit::TestCase

  def setup
    @location = Location.new
   
  end

  def test_that_location_can_release_bikes
    10.times{@location << Bike.new}  
    assert_equal 10,  @location.number_of_bikes
    bike1 = @location.bikes[1]
    released_bike = @location.release_bike(bike1)
    assert_equal 9,  @location.number_of_bikes  
  end

  def test_that_location_can_only_release_specific_bikes
    10.times{@location << Bike.new}  
    assert_equal 10,  @location.number_of_bikes
    bike1 = @location.bikes[1]
    released_bike = @location.release_bike(bike1)
    assert_equal 9,  @location.number_of_bikes
    assert_equal bike1, released_bike
  end

  def test_that_location_can_receive_bikes
    @location << (Bike.new)
    assert_equal 1, @location.number_of_bikes
  end

  def test_that_location_can_only_receive_specific_bikes
    bike1 = Bike.new
    bike2 = Bike.new
    @location << bike1
    @location << bike2
    assert_equal bike1, @location.bikes.find {|i| i == bike1 }
  end

  def test_that_location_returns_number_of_bikes
    assert_equal 0, @location.number_of_bikes
    2.times{ @location << Bike.new }

    assert_equal 2, @location.number_of_bikes
  end

  def test_that_identical_bikes_cannot_be_added_to_location
    assert_raises(RuntimeError) {2.times{@location << @bike}}
  end
end