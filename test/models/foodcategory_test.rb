require 'test_helper'

class FoodcategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @foodcategory = Foodcategory.new(name: "asdd", description: "asdasd")
  end

  test "foodcategory entry should be valid" do
    assert @foodcategory.valid?
  end

  test "foodcategory name should be present" do
    @foodcategory.name = " "
    assert_not @foodcategory.valid?
  end

  test "foodcategory name should not be too long" do
    @foodcategory.name = "a" * 101
    assert_not @foodcategory.valid?
  end

  test "foodcategory description should not be long" do
    @foodcategory.description = "a" * 251
    assert_not @foodcategory.valid?
  end

  test "foodcategory description may be present or not entry should be valid" do
    @foodcategory.description = " "
    assert @foodcategory.valid?
  end

end
