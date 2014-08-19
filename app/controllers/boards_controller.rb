class BoardsController < ApplicationController

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.owner = current_user.email
    @board.user_id = current_user.id
    if @board.save
      redirect_to home_url
    else
      flash.now.alert = "Invalid Article!"
    end
  end
  
  def show
    @boards = @current_user.boards
  end

  private

  def board_params
    params.require(:board).permit(:owner, :title)
  end
end
