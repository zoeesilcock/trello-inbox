require 'rails_helper'

RSpec.describe IdeasController, :type => :controller do
  let (:inbox) { create :inbox }

  describe 'GET #show' do
    before do
      expect_any_instance_of(Idea).to receive(:create_in_trello)
    end

    let (:idea) { create :idea }

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

  describe 'GET #new' do
    context 'not signed in' do
      it 'responds with a redirect to root' do
        get :new, inbox_id: inbox.id
        expect(response).to redirect_to root_url
      end
    end

    when_signed_in do
      it 'responds successfully with an HTTP 200 status code' do
        get :new, inbox_id: inbox.id
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'renders the new template' do
        get :new, inbox_id: inbox.id
        expect(response).to render_template('new')
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
        post :create, inbox_id: inbox.id, idea: idea_attributes
        expect(Idea.last.creator).to eq current_user
      end
    end
  end
end