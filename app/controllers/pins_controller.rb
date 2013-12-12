class PinsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
  end

  def create
    @pin = current_user.pins.build(pin_params)
    if @pin.save
      flash[:success] = "pin created!"
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page],
                                                per_page: 6)
      render 'static_pages/home'
    end
  end

  def destroy
    @pin.destroy
    flash[:success] = "Successful deleted."
    redirect_to root_url
  end

  private
    def pin_params
      params.require(:pin).permit(:content)
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to root_url if @pin.nil?
    end
end