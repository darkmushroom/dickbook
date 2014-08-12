require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:bob)
  end

  test "#encrypt_password encrypts the password" do
    user = User.new
    user.password = "OhPrettyGoodPasswordEh?"
    user.encrypt_password

    assert user.password_hash
    assert 60, user.password_hash.length
    assert "$2a$10$", user.password_hash[0..7]
    assert user.password_salt
  end

  test "#authenticate authenticates user credentials" do
    user = User.authenticate("whiskey.bob@Canada.com", "OhPrettyGoodPasswordEh?")
    assert_equal @user, user
  end

  test "#authenticate returns nil when credentials are invalid" do
    user = User.authenticate("whiskey.bob@Canada.com", "HeyHowBootSomeHockey?")
    assert_nil user
  end
end
