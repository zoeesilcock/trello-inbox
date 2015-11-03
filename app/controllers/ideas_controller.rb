class IdeasController < ApplicationController
  before_action :authenticate_user!
  before_action :find_inbox

  def show
    @idea = Idea.find params[:id]
  end

  def new
    @idea = Idea.new inbox: @inbox
  end

  def create
    @idea = Idea.new idea_parameters.merge(inbox: @inbox, user: current_user)

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
