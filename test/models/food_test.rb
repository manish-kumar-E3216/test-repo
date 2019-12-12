require 'test_helper'

class FoodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @order = Order.new(user_id: 1, date: Time.now, cityinfo_id: "044", address: "ASDFG", comments: "comments", cost: 40)
  end
end
