class FieldsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_inbox

  def create
    authorize @inbox
    Field.create(field_params.merge(inbox_id: @inbox.id))

    redirect_to edit_inbox_path(@inbox)
  end

  def update
    authorize @inbox
    field = Field.find(params[:id])
    field.update_attributes(field_params)

    redirect_to edit_inbox_path(@inbox)
  end

  private

  def field_params
    params.require(:field).permit(:title, :description, :required)
  end

  def find_inbox
    @inbox = Inbox.find params[:inbox_id]
  end
end
