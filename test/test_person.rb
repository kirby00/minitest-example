require './lib/location' 
require './lib/person' # the class under test
require './lib/station' 
require './lib/bike'
require 'minitest/autorun' # the minitest itself
require 'ansi' # makes it colored
require 'turn' # improves the default output

class TestPerson < MiniTest::Unit::TestCase

  def setup
    @person = Person.new
    @station = Station.new
    @bike = Bike.new
  end

  def test_person_can_take_bike
    refute @person.has_bike?
    @station<<(Bike.new)
    assert_equal 1, @station.number_of_bikes
    @person.take_bike_from @station
    assert @person.has_bike?
  end

  def test_person_can_only_take_working_bike
    @station<<(@bike.break!)
    assert_equal 1, @station.number_of_bikes
    @person.take_bike_from @station
    assert_equal 1, @station.number_of_bikes
  end  

  def test_person_can_return_bike
    @person.has_bike?    
    @person.return_bike(@station)
    assert_equal 1, @station.number_of_bikes
  end

  def test_person_has_bike 
    @station << Bike.new
    refute @person.has_bike?
    @person.take_bike_from @station
    assert @person.has_bike?    
  end

  def test_person_can_only_have_one_bike_at_a_time
    2.times{@station<<(Bike.new)}
    @person.take_bike_from @station
    assert_equal 1, @station.number_of_bikes
    assert(@person.has_bike?)
  end
end