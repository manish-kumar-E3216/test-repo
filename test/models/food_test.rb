require 'test_helper'

class FoodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @food = Food.new(foodcategory_id: 1, name: "asdd", description: "asdasd")
  end

  test "food entry should be valid" do
    assert @food.valid?
  end

  test "food name should be present" do
    @food.name = " "
    assert_not @food.valid?
  end

  test "food name should not be too long" do
    @food.name = "a" * 101
    assert_not @food.valid?
  end

  test "description should not be long" do
    @food.description = "a" * 251
    assert_not @food.valid?
  end

  test "description may be present or not entry should be valid" do
    @food.description = " "
    assert @food.valid?
  end


end
