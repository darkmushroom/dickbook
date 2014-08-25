class BoardsController < ApplicationController
  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.user = current_user
    if @board.save
      redirect_to home_url
    else
      flash.now.alert = @board.errors.full_messages
      render 'new'
    end
  end

  def show
    @boards = @current_user.boards
  end

  private

  def board_params
    params.require(:board).permit(:title)
  end
end
