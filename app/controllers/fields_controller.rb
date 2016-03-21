class FieldsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_inbox

  def create
    authorize @inbox
    Field.create(
      field_params.merge(inbox_id: @inbox.id, sorting: @inbox.fields.count)
    )

    redirect_to edit_inbox_path(@inbox)
  end

  def update
    authorize @inbox
    field = Field.find(params[:id])
    field.update_attributes(field_params)

    redirect_to edit_inbox_path(@inbox)
  end

  def update_order
    authorize @inbox

    params['order'].each do |item|
      field = Field.find(item['id'])
      field.update_attributes(sorting: item['sorting'])
    end

    render nothing: true, status: 200
  end

  def destroy
    authorize @inbox
    Field.find(params[:id]).destroy
    render nothing: true, status: 200
  end

  private

  def field_params
    params.require(:field).permit(:title, :description, :required)
  end

  def find_inbox
    @inbox = Inbox.find params[:inbox_id]
  end
end
