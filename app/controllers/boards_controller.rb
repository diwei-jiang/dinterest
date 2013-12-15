class BoardsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  def show
    @board = Board.find(params[:id])
    @pins = @board.pins.paginate(page: params[:page], per_page: 10)
  end

  def new
    @board = current_user.boards.new
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    # if @user.update_attributes(user_params)
    #   flash[:success] = "Profile updated"
    #   redirect_to @user
    # else
    #   render 'edit'
    # end
  end

  def create
    @board = current_user.boards.new(board_params)
    if @board.save
      flash[:success] = "Board create success!"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def destroy
    Board.find(params[:id]).destroy
    flash[:success] = "Board deleted."
    redirect_to current_user
  end

private
  def board_params
    params.require(:board).permit(:name)
  end
end
