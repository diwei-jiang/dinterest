class BoardshipsController < ApplicationController
  before_action :signed_in_user

  def create
    @boardship = Boardship.new(boardship_params)
    @board = Board.find(@boardship.board_id)
    respond_to do |format|
      if @boardship.save
        format.js   {}
      else
        flash[:danger] = ""
        format.html { redirect_to board_path(@board.id) }
      end
    end
  end

  def destroy
    @boardship = Boardship.find(params[:id])
    @board = Board.find(@boardship.board_id)
    @boardship.delete
    respond_to do |format|
      format.js   {}
    end
  end

  private
  def boardship_params
    params.require(:boardship).permit(:board_id, :follower_id)
  end
end