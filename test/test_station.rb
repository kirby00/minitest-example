require './lib/location' 
require './lib/station' # the class under test
require './lib/bike'
require 'minitest/autorun' # the minitest itself
require 'ansi' # makes it colored
require 'turn' # improves the default output

class TestStation < MiniTest::Unit::TestCase

  def setup
    @station = Station.new
  end

  def test_station_returns_error_if_at_capacity
    10.times{@station << Bike.new}
    assert_equal 10,  @station.number_of_bikes    
    begin
      @station << Bike.new
    rescue RuntimeError => e
      assert_equal "Station full", e.message      
    end
  end

  def test_station_is_empty_after_creation
    assert_equal 0, @station.number_of_bikes
  end

  def test_station_can_receive_specific_bike    
    bike1 = Bike.new
    bike2 = Bike.new
    @station << bike1
    @station << bike2
    assert_equal bike1, @station.bikes.find {|i| i == bike1 }
  end

  def test_only_unqiue_bike_can_be_recieved_by_station
    assert_raises(RuntimeError) {2.times{@station << @bike}}
  end

  def test_station_can_release_specific_bike
    10.times{@station << Bike.new}	
    assert_equal 10,  @station.number_of_bikes
    bike1 = @station.bikes[1]
    released_bike = @station.release_bike(bike1)
  	assert_equal 9,  @station.number_of_bikes
    assert_equal bike1, released_bike
  end

  def test_station_returns_bike_broken
    bike = Bike.new
    bike.break!
    @station<<(bike)
    @station<<(Bike.new)
    #This @bikes instance var exist only in the test class, so we are testing something within the test class not the station class
    assert_equal 1, @station.broken_bikes.length 
  end

  def test_station_returns_working_bikes
    bike = Bike.new
    bike.break!
    @station<<(bike)
    @station<<(Bike.new)
    assert_equal 1, @station.working_bikes.length 
  end
end