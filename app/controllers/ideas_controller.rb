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

    if @idea.save
      create_field_values
      @idea.create_in_trello
    end

    redirect_to inbox_path(@inbox)
  end

  def edit
    @idea = Idea.find params[:id]
    authorize @idea
  end

  def update
    @idea = Idea.find params[:id]
    authorize @idea

    if @idea.update_attributes(idea_parameters)
      update_field_values
      @idea.update_in_trello
    end

    redirect_to inbox_path(@inbox)
  end

  private

  def idea_parameters
    params.require(:idea).permit(:title)
  end

  def field_parameters
    params.fetch(:fields, {}).permit(ids: @inbox.fields.map { |f| f.id.to_s })
  end

  def find_inbox
    @inbox = Inbox.find params[:inbox_id]
  end

  def create_field_values
    return if field_parameters['ids'].nil?

    field_parameters['ids'].each do |id, value|
      FieldValue.create(
        idea_id: @idea.id,
        field_id: id,
        value: value
      )
    end
  end

  def update_field_values
    return if field_parameters['ids'].nil?

    field_parameters['ids'].each do |id, value|
      field_value = @idea.field_values.where(field_id: id).first
      field_value.update_attributes(value: value)
    end
  end
end
