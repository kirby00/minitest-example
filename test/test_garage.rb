require './lib/garage' # the class under test
require './lib/van' 
require './lib/person' 
require './lib/station' 
require './lib/bike'
require 'minitest/autorun' # the minitest itself
require 'ansi' # makes it colored
require 'turn' # improves the default output

class TestGarage < MiniTest::Unit::TestCase

  def setup
    @garage = Garage.new
    @bike = Bike.new
  end

  def test_only_unqiue_bike_can_be_recieved_by_garage
    assert_raises(RuntimeError) {2.times{@garage << @bike}}
  end

  def test_garage_can_accept_bike
    @bike.break!
    @garage << @bike
    assert_equal 1, @garage.number_of_bikes
  end

  def test_garage_can_only_accept_broken_bikes    
    assert_raises(RuntimeError) { @garage << Bike.new }
    @garage << Bike.new.break!
    assert_equal 1, @garage.bikes.count
  end

  def test_garage_can_release_bike    
    10.times { @garage << Bike.new.break! }
    bike7 = @garage.bikes[7]
    assert_equal 10, @garage.bikes.count
    released_bike = @garage.release_bike(bike7)
    assert_equal 9, @garage.bikes.count
    assert_equal bike7, released_bike
  end

  def test_garage_can_only_release_fixed_bikes
    @garage << @bike.break!
    assert_equal 1, @garage.number_of_bikes
    released_bike = @garage.release_bike(@bike)
    refute @bike.broken?
  end
end

