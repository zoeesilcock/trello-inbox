class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    authorize Idea

    idea = Idea.find(params[:id])
    comment = Comment.new comment_parameters
    comment.idea = idea
    comment.user_name = current_user.name
    comment.user_avatar = current_user.avatar
    comment.create_in_trello current_user if comment.save

    redirect_to idea_path(idea.inbox, idea)
  end

  private

  def comment_parameters
    params.require(:comment).permit(:text)
  end
end
