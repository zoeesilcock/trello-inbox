class IdeasController < ApplicationController
  before_action :authenticate_user!
  before_action :find_inbox

  def show
    @idea = Idea.find params[:id]
    authorize @idea
  end

  def create
    @idea = Idea.new idea_parameters.merge(inbox: @inbox, user: current_user)
    authorize @idea

    @idea.save
    redirect_to inbox_path(@inbox)
  end

  def edit
    @idea = Idea.find params[:id]
    authorize @idea
  end

  def update
    @idea = Idea.find params[:id]
    authorize @idea

    @idea.update_attributes(idea_parameters)
    redirect_to inbox_path(@inbox)
  end

  private

  def idea_parameters
    params.require(:idea).permit(:title, :description)
  end

  def find_inbox
    @inbox = Inbox.find params[:inbox_id]
  end
end
