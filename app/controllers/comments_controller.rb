class CommentsController < ApplicationController

  def create
    if params.include?(:user_id)
      @user = User.find_by(id: params[:user_id])
      @comment = @user.comments.new(comment_params)
    elsif params.include?(:goal_id)
      @goal = Goal.find_by(id: params[:goal_id])
      @comment = @goal.comments.new(comment_params)
    end
      if @comment.save && @user
        redirect_to user_url(@user)
      elsif @comment.save && @goal
        redirect_to goal_url(@goal)
      else
        flash[:errors] = @comment.errors.full_messages
        if @user
          redirect_to user_url(@user)
        else
          redirect_to goal_url(@goal)
        end
      end
    end

    def comment_params
      params.require(:comment).permit(:body)
    end

end
