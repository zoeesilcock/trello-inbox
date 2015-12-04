class CommentsController < ApplicationController
  def create
    authorize Idea
    redirect_to idea_path(params[:inbox_id], params[:id])
  end
end
