class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def show
    @user = User.find(params[:id])
    @boards = @user.boards.paginate(page: params[:page], per_page: 10)
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    @user[:activation_token] = generate_token
    if @user.save
      send_activation(@user)
      flash[:success] = "An activation email just sent to #{@user.email}"
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                :password_confirmation)
  end

  # Before filters
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
  
  def admin_user
      redirect_to(root_url) unless current_user.admin?
  end

  def send_activation(user)
    ActivatedMailer.registration_confirmation(user).deliver
  end

  def generate_token
    SecureRandom.urlsafe_base64
  end
end
