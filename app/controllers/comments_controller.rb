class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_idea

  def create
    authorize Idea

    comment = Comment.new comment_parameters
    comment.create_in_trello current_user if comment.save

    redirect_to idea_path(@idea.inbox, @idea)
  end

  private

  def find_idea
    @idea = Idea.find(params[:id])
  end

  def comment_parameters
    params.require(:comment).permit(:text)
  end

  def comment_attributes
    comment_parameters.merge(
      idea: @idea,
      user_name: current_user.name,
      user_avatar: current_user.avatar
    )
  end
end
