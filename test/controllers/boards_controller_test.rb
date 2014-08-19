require 'test_helper'

class BoardsControllerTest < ActionController::TestCase
  test "#create should create new board" do
    assert_difference('Board.count') do
      post :create, board: {user_id: 1, owner: 'WhiskeyBob', title: 'Moonshine'}
    end
  end
end
