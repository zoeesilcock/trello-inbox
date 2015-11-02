class InboxesController < ApplicationController
  before_action :authenticate_user!

  def index
    @inboxes = Inbox.all
  end

  def show
    @inbox = Inbox.find params[:id]
  end

  def new
    @inbox = Inbox.new
    @boards = Trello::Organization.find(ENV['TRELLO_ORGANIZATION_ID']).boards.map do |board|
      [board.name, board.id]
    end
  end

  def create
    @inbox = Inbox.new inbox_parameters

    if @inbox.save
      redirect_to inbox_path(@inbox)
    else
      render :new
    end
  end

  private

  def inbox_parameters
    params.require(:inbox).permit(:title, :board_id)
  end
end
