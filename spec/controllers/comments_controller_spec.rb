require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'POST #create' do
    let(:comment_attributes) { attributes_for :comment }

    context 'not signed in' do
      it 'responds with a redirect to root' do
        post :create, inbox_id: 1, id: 1, comment: comment_attributes
        expect(response).to redirect_to root_url
      end
    end
  end
end
