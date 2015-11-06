require 'rails_helper'

RSpec.describe IdeasController, type: :controller do
  before do
    allow_any_instance_of(Idea).to receive(:create_in_trello)
  end

  let(:inbox) { create :inbox }
  let(:idea) { create :idea, inbox: inbox }

  describe 'GET #show' do
    context 'not signed in' do
      it 'responds with a redirect to root' do
        get :show, inbox_id: inbox.id, id: idea.id
        expect(response).to redirect_to root_url
      end
    end

    when_signed_in do
      it 'responds successfully with an HTTP 200 status code' do
        get :show, inbox_id: inbox.id, id: idea.id
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'renders the index template' do
        get :show, inbox_id: inbox.id, id: idea.id
        expect(response).to render_template('show')
      end
    end
  end

  describe 'POST #create' do
    let(:idea_attributes) { attributes_for :idea }

    context 'not signed in' do
      it 'responds with a redirect to root' do
        post :create, inbox_id: inbox.id, idea: idea_attributes
        expect(response).to redirect_to root_url
      end
    end

    when_signed_in do
      it 'redirects to the inbox' do
        expect_any_instance_of(Idea).to receive(:create_in_trello)
        post :create, inbox_id: inbox.id, idea: idea_attributes
        expect(response).to redirect_to inbox_url(inbox)
      end

      it 'adds the current user as the creator' do
        expect_any_instance_of(Idea).to receive(:create_in_trello)
        post :create, inbox_id: inbox.id, idea: idea_attributes
        expect(Idea.last.user).to eq current_user
      end
    end
  end

  describe 'GET #edit' do
    context 'not signed in' do
      it 'responds with a redirect to root' do
        get :edit, inbox_id: inbox.id, id: idea.id
        expect(response).to redirect_to root_url
      end
    end

    when_signed_in do
      before do
        idea.update_attribute :user, current_user
      end

      it 'responds successfully with an HTTP 200 status code' do
        get :edit, inbox_id: inbox.id, id: idea.id
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'renders the edit template' do
        get :edit, inbox_id: inbox.id, id: idea.id
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'POST #create' do
    let(:new_title) { 'A far superior title' }
    let(:idea_attributes) { attributes_for(:idea).merge(title: new_title) }

    context 'not signed in' do
      it 'responds with a redirect to root' do
        post :update, inbox_id: inbox.id, id: idea.id, idea: idea_attributes
        expect(response).to redirect_to root_url
      end
    end

    when_signed_in do
      before do
        idea.update_attribute :user, current_user
      end

      it 'redirects to the inbox' do
        post :update, inbox_id: inbox.id, id: idea.id, idea: idea_attributes
        expect(response).to redirect_to inbox_url(inbox)
      end

      it 'changes the title to the new title' do
        post :update, inbox_id: inbox.id, id: idea.id, idea: idea_attributes
        expect(idea.reload.title).to eq new_title
      end
    end
  end
end
