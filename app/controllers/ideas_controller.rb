class IdeasController < ApplicationController
  before_action :authenticate_user!
  before_action :find_inbox

  def show
    @idea = Idea.find params[:id]
    authorize @idea
  end

  def new
    @idea = Idea.new inbox: @inbox
    authorize @idea
  end

  def create
    @idea = Idea.new idea_parameters.merge(inbox: @inbox, user: current_user)
    authorize @idea

    if @idea.save
      redirect_to inbox_path(@inbox)
    else
      render :new
    end
  end

  private

  def idea_parameters
    params.require(:idea).permit(:title, :description)
  end

  def find_inbox
    @inbox = Inbox.find params[:inbox_id]
  end
end
