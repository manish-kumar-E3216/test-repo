require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  def setup
    @order = Order.new(user_id: 1, date: Time.now, cityinfo_id: "044", address: "ASDFG", comments: "comments", cost: 40)
  end

  test "order should be valid" do
    assert @order.valid?
  end

  test "address should be present" do
    @order.address = " "
    assert_not @order.valid?
  end

  test "address should not be too long" do
    @order.address = "a" * 251
    assert_not @order.valid?
  end

  test "order should be valid if comments is empty" do
    @order.comments = " "
    assert @order.valid?
  end

  test "order comments should not be too long" do
    @order.comments = "c" * 251
    assert_not @order.valid?
  end


end
