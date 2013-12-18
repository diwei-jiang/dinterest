class CommentsController < ApplicationController
  before_action :signed_in_user

  def create
    @comment = Comment.new(comment_params)
    @pin = @comment.pin
    @comments = @pin.comments.paginate(page: params[:page], per_page: 5)
    respond_to do |format|
      if @comment.save
        format.js   {}
      else
        flash[:danger] = "Failed to comment."
        format.html { redirect_to pin_path(@pin.id) }
      end
    end
  end
  
  def destory

  end
  
  private
    def comment_params
      params.require(:comment).permit(:content, :pin_id, :user_id)
    end
end
