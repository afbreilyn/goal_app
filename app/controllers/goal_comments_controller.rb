class GoalCommentsController < ApplicationController

  def create
    @goal = Goal.find(params[:goal_comment][:goal_id])
    @comment = @goal.comments.new(comment_params)

    if @comment.save
      redirect_to goal_url(@goal)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to goal_url(@goal)
    end
  end

  def comment_params
    params.require(:goal_comment).permit(:body, :goal_id)
  end


end
