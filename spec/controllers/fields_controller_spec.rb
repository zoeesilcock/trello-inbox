require 'rails_helper'

RSpec.describe FieldsController, type: :controller do
  let(:inbox) { create :inbox }

  describe 'POST #create' do
    let(:field_attributes) { attributes_for :field }

    context 'not signed in' do
      it 'responds with a redirect to root' do
        post :create, inbox_id: inbox.id, field: field_attributes
        expect(response).to redirect_to root_url
      end
    end

    when_signed_in_as(:creator) do
      before do
        inbox.update_attribute :user, current_user
      end

      it 'redirects to the edit inbox page' do
        post :create, inbox_id: inbox.id, field: field_attributes
        expect(response).to redirect_to edit_inbox_path(inbox)
      end

      it 'creates the field on the inbox' do
        post :create, inbox_id: inbox.id, field: field_attributes
        expect(inbox.reload.fields.last.title).to eq(field_attributes[:title])
      end
    end
  end

  describe 'POST #update' do
    let(:field) { create :field, inbox: inbox }
    let(:new_title) { 'Some other title' }
    let(:field_attributes) { attributes_for(:field).merge(title: new_title) }

    context 'not signed in' do
      it 'responds with a redirect to root' do
        post :update, inbox_id: inbox.id, id: field.id, field: field_attributes
        expect(response).to redirect_to root_url
      end
    end

    when_signed_in_as(:creator) do
      before do
        inbox.update_attribute :user, current_user
      end

      it 'redirects to the edit inbox page' do
        post :update, inbox_id: inbox.id, id: field.id, field: field_attributes
        expect(response).to redirect_to edit_inbox_path(inbox)
      end

      it 'changes the title to the new title' do
        post :update, inbox_id: inbox.id, id: field.id, field: field_attributes
        expect(inbox.reload.fields.last.title).to eq new_title
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:field) { create :field, inbox: inbox }

    context 'not signed in' do
      it 'responds with a redirect to root' do
        delete :destroy, inbox_id: inbox.id, id: field.id
        expect(response).to redirect_to root_url
      end
    end

    when_signed_in_as(:creator) do
      before do
        inbox.update_attribute :user, current_user
      end

    it 'responds successfully with an HTTP 200 status code' do
        delete :destroy, inbox_id: inbox.id, id: field.id
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'removes the field' do
        delete :destroy, inbox_id: inbox.id, id: field.id
        expect { Field.find(field.id) }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
