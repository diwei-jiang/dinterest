class PinsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def new
    @pin = current_user.pins.new
    @boards = current_user.boards
  end

  def show
    @pin = Pin.find(params[:id])
  end

  def create
    @pin = current_user.pins.new
    @pin.url = pin_params[:url]
    @pin.board_id = Board.find_by(name: pin_params[:board]).id
    @pin.description = pin_params[:description]

    if @pin.save
      flash[:success] = "pin created!"
      redirect_to @pin
    else
      @boards = current_user.boards
      render action: 'new'
    end
  end

  def destroy
    @pin.destroy
    flash[:success].now = "Successful deleted."
    redirect_to root_url
  end

  private
    def pin_params
      params.require(:pin).permit(:url, :image_file, :board, :description)
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to root_url if @pin.nil?
    end
end