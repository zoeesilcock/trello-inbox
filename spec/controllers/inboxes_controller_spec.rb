require 'rails_helper'

RSpec.describe InboxesController, :type => :controller do
  describe 'GET #index' do
    context 'not signed in' do
      it 'responds with a redirect to root' do
        get :index
        expect(response).to redirect_to root_url
      end
    end

    when_signed_in do
      it 'responds successfully with an HTTP 200 status code' do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'renders the index template' do
        get :index
        expect(response).to render_template('index')
      end
    end
  end

  describe 'GET #show' do
    let(:inbox) { create :inbox }

    context 'not signed in' do
      it 'responds with a redirect to root' do
        get :show, inbox_id: inbox.id
        expect(response).to redirect_to root_url
      end
    end

    when_signed_in do
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

    when_signed_in do
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

    when_signed_in do
      it 'redirects to the newly created inbox' do
        post :create, inbox: inbox_attributes
        inbox = Inbox.last
        expect(response).to redirect_to inbox
      end

      it 'adds the current user as the creator' do
        post :create, inbox: inbox_attributes
        expect(Inbox.last.creator).to eq current_user
      end
    end
  end
end
