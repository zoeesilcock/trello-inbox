class InboxesController < ApplicationController
  before_action :authenticate_user!

  def index
    @inboxes = Inbox.all
  end

  def show
    @inbox = Inbox.find params[:inbox_id]
    authorize @inbox
    @ideas = @inbox.ideas
  end

  def new
    @inbox = Inbox.new
    authorize @inbox
    @boards = Trello::Organization.find(
      ENV['TRELLO_ORGANIZATION_ID']
    ).boards.map do |board|
      [board.name, board.id]
    end
  end

  def create
    @inbox = Inbox.new inbox_parameters.merge(user: current_user)
    authorize @inbox

    if @inbox.save
      redirect_to inbox_path(@inbox)
    else
      render :new
    end
  end

  def edit
    @inbox = Inbox.find params[:inbox_id]
    authorize @inbox
  end

  def update
    @inbox = Inbox.find params[:inbox_id]
    authorize @inbox

    if @inbox.update_attributes(inbox_parameters)
      redirect_to inbox_path(@inbox)
    else
      render :edit
    end
  end

  def destroy
    @inbox = Inbox.find params[:inbox_id]
    authorize @inbox
  end

  private

  def inbox_parameters
    params.require(:inbox).permit(:title, :board_id)
  end
end
