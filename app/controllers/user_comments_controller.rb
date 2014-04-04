class UserCommentsController < ApplicationController

  def create
    @user = User.find(params[:user_comment][:user_id])
    @comment = @user.comments.new(comment_params)

    if @comment.save
      redirect_to user_url(@user)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to user_url(@user)
    end
  end

  def comment_params
    params.require(:user_comment).permit(:body, :user_id)
  end


end
