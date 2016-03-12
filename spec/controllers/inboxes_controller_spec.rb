require 'rails_helper'

RSpec.describe InboxesController, type: :controller do
  describe 'GET #show' do
    let(:inbox) { create :inbox }

    context 'not signed in' do
      it 'responds with a redirect to root' do
        get :show, inbox_id: inbox.id
        expect(response).to redirect_to root_url
      end
    end

    when_signed_in_as(:user) do
      it 'responds successfully with an HTTP 200 status code' do
        get :show, inbox_id: inbox.id
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'renders the show template' do
        get :show, inbox_id: inbox.id
        expect(response).to render_template('show')
      end
    end
  end

  describe 'GET #new' do
    context 'not signed in' do
      it 'responds with a redirect to root' do
        get :new
        expect(response).to redirect_to root_url
      end
    end

    when_signed_in_as(:creator) do
      let(:boards) { [double(:board, id: 'xyz', name: 'Kewl board')] }
      let(:organization) { double(:organization, boards: boards) }

      it 'responds successfully with an HTTP 200 status code' do
        get :new
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'renders the new template' do
        get :new
        expect(response).to render_template('new')
      end
    end
  end

  describe 'POST #create' do
    let(:inbox_attributes) { attributes_for :inbox }

    context 'not signed in' do
      it 'responds with a redirect to root' do
        post :create, inbox: inbox_attributes
        expect(response).to redirect_to root_url
      end
    end

    when_signed_in_as(:creator) do
      context 'with valid attributes' do
        before do
          expect_any_instance_of(Inbox).to receive(:create_lists)
        end

        it 'redirects to the newly created inbox' do
          post :create, inbox: inbox_attributes
          inbox = Inbox.last
          expect(response).to redirect_to inbox
        end

        it 'adds the current user as the creator' do
          post :create, inbox: inbox_attributes
          expect(Inbox.last.user).to eq current_user
        end

        it 'creates a default field for the new inbox' do
          post :create, inbox: inbox_attributes
          expect(Inbox.last.fields.count).to eq 1
        end
      end

      context 'with invalid attributes' do
        let(:invalid_inbox_attributes) { inbox_attributes.merge(title: nil) }

        it 'renders the new template' do
          post :create, inbox: invalid_inbox_attributes
          expect(response).to render_template('new')
        end
      end
    end
  end

  describe 'GET #edit' do
    let(:inbox) { create :inbox }

    context 'not signed in' do
      it 'responds with a redirect to root' do
        get :edit, inbox_id: inbox.id
        expect(response).to redirect_to root_url
      end
    end

    when_signed_in_as(:creator) do
      before do
        inbox.update_attribute :user, current_user
      end

      it 'responds successfully with an HTTP 200 status code' do
        get :edit, inbox_id: inbox.id
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'renders the edit template' do
        get :edit, inbox_id: inbox.id
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'POST #update' do
    let(:inbox) { create :inbox }
    let(:new_title) { 'Some other title' }
    let(:inbox_attributes) { attributes_for(:inbox).merge(title: new_title) }

    context 'not signed in' do
      it 'responds with a redirect to root' do
        post :update, inbox_id: inbox.id, inbox: inbox_attributes
        expect(response).to redirect_to root_url
      end
    end

    when_signed_in_as(:creator) do
      context 'with valid attributes' do
        before do
          inbox.update_attribute :user, current_user
        end

        it 'redirects to the newly updated inbox' do
          post :update, inbox_id: inbox.id, inbox: inbox_attributes
          expect(response).to redirect_to inbox
        end

        it 'changes the title to the new title' do
          post :update, inbox_id: inbox.id, inbox: inbox_attributes
          expect(inbox.reload.title).to eq new_title
        end
      end

      context 'with invalid attributes' do
        let(:invalid_inbox_attributes) { inbox_attributes.merge(title: nil) }

        before do
          inbox.update_attribute :user, current_user
        end

        it 'renders the edit template' do
          get :update, inbox_id: inbox.id, inbox: invalid_inbox_attributes
          expect(response).to render_template('edit')
        end
      end
    end
  end
end
