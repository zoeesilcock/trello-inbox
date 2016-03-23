require 'rails_helper'

RSpec.describe VisitorsController, type: :controller do
  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    when_signed_in_as(:user) do
      context 'with only one inbox' do
        let!(:inbox) { create :inbox }

        it 'redirects to the inbox' do
          get :index
          expect(response).to redirect_to(inbox)
        end
      end
    end
  end
end
