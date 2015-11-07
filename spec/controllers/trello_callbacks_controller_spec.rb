require 'rails_helper'

RSpec.describe TrelloCallbacksController, type: :controller do
  describe 'POST #webhook' do
    it 'responds successfully with an HTTP 200 status code' do
      data = { dummy_data: true, message: 'hello world' }

      post :webhook, data.to_json, format: :json, type: 'card', id: 1
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
