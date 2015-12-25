class CommentsController < ApplicationController
  def create
    authorize Idea

    idea = Idea.find(params[:id])
    comment = Comment.new comment_parameters.merge(idea: idea)
    comment.create_in_trello current_user if comment.valid?

    redirect_to idea_path(idea.inbox, idea)
  end

  private

  def comment_parameters
    params.require(:comment).permit(:text)
  end
end
