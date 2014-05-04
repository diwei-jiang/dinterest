class SessionsController < ApplicationController
  before_action :already_signin?, only: [:new]
  def new
    render 'new'
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password]) && user.active
      sign_in user
      redirect_back_or root_url
    elsif !user.active
      flash.now[:danger] = 'Please activate you account'
      render 'new'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

  private
    def already_signin?
      if signed_in?
        flash[:warning] = 'Already sign in, please sign out first.'
        redirect_to root_url
      end
    end
end