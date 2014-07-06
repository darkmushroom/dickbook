require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:bob)
  end

  test "#encrypt_password encrypts the password" do
    user = User.new
    user.password = "OhPrettyGoodPasswordEh?"
    user.encrypt_password

    assert_equal "$2a$10$JRTKTNuXTDps9GPbe8wBje7xQfdWU4At0KlCepxzKTTYKWdGF4/wq", user.password_hash
    assert user.password_salt
end
