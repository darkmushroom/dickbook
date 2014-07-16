require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  test "#create should render new if the credentials are incorrect" do
      post :create, user: {email: 'test@test.com', password: '1234'}
      assert_equal 'Invalid email or password', flash[:alert]
  end


  test "#create should create new session" do
    assert_difference('session.count') do
      post :create, user: {email: 'test@test.com', password: 'test'}
    end
  end

  test "#destroy should wax the session" do
    post :destroy
    assert_nil session[:user_id]
  end
end
