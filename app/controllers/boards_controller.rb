class BoardsController < ApplicationController

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.save
    render "new"
  end

  private

  def board_params
    params.require(:board).permit(:owner, :title)
  end
end
