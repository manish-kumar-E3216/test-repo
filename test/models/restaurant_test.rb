require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  def setup
    @restaurant = Restaurant.new(name: "asdasd")
  end
  test "restaurant should be valid" do
    assert @restaurant.valid?
  end

  test "restaurant name should be present" do
    @restaurant.name=" "
    assert_not @restaurant.valid?
  end

  test "restaurant name should not be too long" do
    @restaurant.name = "a" * 51
    assert_not @restaurant.valid?
  end
end
