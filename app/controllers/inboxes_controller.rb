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
    load_boards
  end

  def create
    @inbox = Inbox.new inbox_parameters.merge(user: current_user)
    authorize @inbox

    if @inbox.save
      @inbox.create_lists
      create_default_field

      redirect_to inbox_path(@inbox)
    else
      render :new
    end
  end

  def edit
    @inbox = Inbox.find params[:inbox_id]
    authorize @inbox
    @fields = @inbox.fields
    load_boards
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

  private

  def inbox_parameters
    params.require(:inbox).permit(:title, :board_id)
  end

  def load_boards
    @boards = Trello::Organization.find(
      ENV['TRELLO_ORGANIZATION_ID']
    ).boards.map do |board|
      [board.name, board.id]
    end
  end

  def create_default_field
    Field.create(
      title: t('fields.default.title'),
      description: t('fields.default.description'),
      required: true,
      order: 1,
      inbox: @inbox
    )
  end
end
