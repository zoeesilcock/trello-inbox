class IdeasController < ApplicationController
  before_action :authenticate_user!

  def new
    @inbox = Inbox.find params[:inbox_id]
    @idea = Idea.new inbox: @inbox
  end

  def create
    @inbox = Inbox.find params[:inbox_id]
    @idea = Idea.new idea_parameters.merge(inbox: @inbox)

    if @idea.save
      redirect_to inbox_idea_path(@inbox, @idea)
    else
      render :new
    end
  end

  private

  def idea_parameters
    params.require(:idea).permit(:title, :description)
  end
end
