require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    context 'not signed in' do
      it 'responds with a redirect to root' do
        get :index
        expect(response).to redirect_to root_url
      end
    end

    when_signed_in_as(:user) do
      it 'responds with a redirect to root' do
        get :index
        expect(response).to redirect_to root_url
      end
    end

    when_signed_in_as(:admin) do
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
end
