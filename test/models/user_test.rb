require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(fname: "Test",lname: "user", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "fname should be present" do
    @user.fname = " "
    assert_not @user.valid?
  end

  test "lname should be present" do
    @user.lname = " "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "fname should not be too long" do
    @user.fname = "f"*51
    assert_not @user.valid?
  end

  test "lname should not be too long" do
    @user.lname = "l"*51
    assert_not @user.valid?
  end

  test "email shoould not be too long" do
    @user.email = "e" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = ["user@example,com", "user_at_foo.org", "user.name@example.",
        "foo@bar_baz.com", "foo@bar+baz.com"]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, '')
  end


end
