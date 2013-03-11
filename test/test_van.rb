require './lib/location' 
require './lib/van' # the class under test
require './lib/person' 
require './lib/station' 
require './lib/bike'
require 'minitest/autorun' # the minitest itself
require 'ansi' # makes it colored
require 'turn' # improves the default output

class TestVan < MiniTest::Unit::TestCase

  def setup
    @van = Van.new
    @bike = Bike.new
  end

  def test_van_can_receive_bikes
    @van << (@bike)
    assert_equal 1, @van.number_of_bikes
  end

  def test_van_can_release_bikes
    @van << (@bike)
    assert_equal @bike , @van.release_bike(@bike)
  end

  def test_van_can_return_broken_bikes
    @bike.break!
    @van << @bike
    assert_equal 1, @van.broken_bikes.length
  end

  def test_van_can_return_working_bikes
    @bike.break!
    @workingbike = Bike.new
    @van << @bike
    @van << @workingbike
    assert_equal 2, @van.number_of_bikes
    assert_equal 1, @van.working_bikes.length
  end

  def test_only_unqiue_bike_can_be_recieved_by_van
    assert_raises(RuntimeError) {2.times{@van << @bike}}
  end

end

