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

    when_signed_in_as(:user) do
      let(:idea) { create :idea }

      context 'with valid attributes' do
        it 'creates the comment in trello' do
          expect_any_instance_of(Comment).to receive(:create_in_trello).with(
            current_user
          )
          post :create, inbox_id: 1, id: idea.id, comment: comment_attributes
          expect(response).to redirect_to idea_path(idea.inbox, idea)
        end
      end

      context 'with invalid attributes' do
        let(:invalid_comment_attributes) { comment_attributes.merge(text: nil) }

        it 'redirects to the idea' do
          post :create, inbox_id: 1, id: idea.id,
            comment: invalid_comment_attributes
          expect(response).to redirect_to idea_path(idea.inbox, idea)
        end
      end
    end
  end
end
