class LikeshipsController < ApplicationController
  before_action :signed_in_user

  def create
    @likeship = Likeship.new(likeship_params)
    @pin = Pin.find(@likeship.pin_id)
    respond_to do |format|
      if @likeship.save
        format.js   {}
      else
        flash[:danger] = "Failed to Follow."
        format.html { redirect_to pin_path(@pin.id) }
      end
    end
  end

  def destroy
    @likeship = Likeship.find(params[:id])
    @pin = Pin.find(@likeship.pin_id)
    @likeship.delete
    respond_to do |format|
      format.js   {}
    end
  end

  private
  def likeship_params
    params.require(:likeship).permit(:user_id, :pin_id)
  end
end