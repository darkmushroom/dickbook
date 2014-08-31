require 'test_helper'

class UserLogsInMakesBoardTest < ActionDispatch::IntegrationTest

  test "login and create a board" do
    get "/login"
    assert_response :success

    post_via_redirect "/sessions", email: users(:bob).email, 
      password: 'OhPrettyGoodPasswordEh?'
    assert_equal '/home', path

    get "/create_board"
    assert_response :success

    post_via_redirect "/boards", board: { title: "How boot fishin?'" }
    assert_equal '/home', path
    assert assigns(:boards)
  end
end
