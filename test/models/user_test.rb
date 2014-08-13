require 'test_helper'

class UserTest < ActiveSupport::TestCase
    def setup
        # Fixtures
        @user = users(:bob)

        # Class members
        @new_user = User.new
        @new_user.password = "OhPrettyGoodPasswordEh?"
        @new_user.encrypt_password
    end

    test "#encrypt_password encrypts the password" do
        assert @new_user.password_hash
        assert @new_user.password_salt
    end

    test "#encrypt_password BCrypt results" do
        assert 60, @new_user.password_hash.length
        assert "$2a$10$", @new_user.password_hash[0..7]
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
