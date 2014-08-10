require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  test "#create should render new if the credentials are incorrect" do
      post :create, {email: 'test@test.com', password: '1234'}
      assert_equal 'Invalid email or password', flash[:alert]
  end


  test "#create should create new session" do
    assert_difference('session.count') do
      post :create, {email: 'whiskey.bob@Canada.com', password: 'OhPrettyGoodPasswordEh?'}
    end
    assert_response :redirect
    assert_redirected_to :home
  end

  test "#destroy should wax the session" do
    assert_difference('session.count - 1') do
      post :destroy
      assert_nil session[:user_id]
      assert_response :redirect
      assert_redirected_to :root
    end
  end
end
