class HomeController < ApplicationController
  def show
    @boards = @current_user.boards
  end
end
