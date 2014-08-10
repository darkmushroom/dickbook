require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "#create should create new user" do
    assert_difference('User.count') do
      post :create, user: {email: 'test@test.com', password: 'test', password_confirmation: 'test'}
    end

    assert_redirected_to root_url
  end

  test "#new should render and display a signup form" do
    get :new
    assert_response :success
    assert css_select(".signup_form").first
  end
end
