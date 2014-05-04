class ActivationsController < ApplicationController
  def update
    @user = User.find_by_activation_token(params[:activation_token])

    @user.update_attribute(:active, true)
    flash[:success] = "Your account is now activated."
    redirect_to root_path
  end
end
