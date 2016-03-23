require 'rails_helper'

RSpec.describe TrelloCallbacksController, type: :controller do
  let(:idea) { create :idea }

  describe 'POST #webhook' do
    let(:data) { webhook_fixture 'add_comment' }

    it 'responds successfully with an HTTP 200 status code' do
      post :webhook, data, format: :json, type: 'card', id: idea.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    describe 'association to idea' do
      it 'hooks the activity up to the idea' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.idea_id).to eq idea.id
      end
    end

    describe 'updating labels' do
      let(:data) { webhook_fixture 'add_label' }

      context 'with no label saved' do
        it 'creates a new label' do
          expect do
            post :webhook, data, format: :json, type: 'card', id: idea.id
          end.to change(Label, :count).from(0).to(1)
        end

        it 'hooks the new label up to the idea' do
          expect do
            post :webhook, data, format: :json, type: 'card', id: idea.id
          end.to change(idea.labels, :count).from(0).to(1)
        end
      end

      context 'with a label saved' do
        let!(:label) { create :label, trello_id: '5631f20b19ad3a5dc2f444df' }

        it 'updates the label' do
          post :webhook, data, format: :json, type: 'card', id: idea.id
          label.reload
          expect(label.text).to eq 'A real label'
          expect(label.color).to eq 'green'
        end
      end
    end

    context 'add attachment' do
      let(:data) { webhook_fixture 'add_attachment' }

      it 'creates an activity' do
        expect do
          post :webhook, data, format: :json, type: 'card', id: idea.id
        end.to change(Activity, :count).from(0).to(1)
      end

      it 'has the correct action' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.action).to eq 'added'
      end

      it 'has the correct target' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.target).to eq 'attachment'
      end

      it 'has the correct data' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.data).to include(
          text: 'favicon.ico',
          preview: 'https://example.com/image.png'
        )
      end
    end

    context 'remove attachment' do
      let(:data) { webhook_fixture 'remove_attachment' }

      it 'creates an activity' do
        expect do
          post :webhook, data, format: :json, type: 'card', id: idea.id
        end.to change(Activity, :count).from(0).to(1)
      end

      it 'has the correct action' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.action).to eq 'removed'
      end

      it 'has the correct target' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.target).to eq 'attachment'
      end

      it 'has the correct data' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.data).to include(
          text: 'favicon.ico'
        )
      end
    end

    context 'add checklist' do
      let(:data) { webhook_fixture 'add_checklist' }

      it 'creates an activity' do
        expect do
          post :webhook, data, format: :json, type: 'card', id: idea.id
        end.to change(Activity, :count).from(0).to(1)
      end

      it 'has the correct action' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.action).to eq 'added'
      end

      it 'has the correct target' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.target).to eq 'checklist'
      end

      it 'has the correct data' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.data).to include(
          text: 'Some checklist'
        )
      end
    end

    context 'remove checklist' do
      let(:data) { webhook_fixture 'remove_checklist' }

      it 'creates an activity' do
        expect do
          post :webhook, data, format: :json, type: 'card', id: idea.id
        end.to change(Activity, :count).from(0).to(1)
      end

      it 'has the correct action' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.action).to eq 'removed'
      end

      it 'has the correct target' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.target).to eq 'checklist'
      end

      it 'has the correct data' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.data).to include(
          text: 'Some checklist'
        )
      end
    end

    context 'add checklist item' do
      let(:data) { webhook_fixture 'add_checklist_item' }

      it 'creates an activity' do
        expect do
          post :webhook, data, format: :json, type: 'card', id: idea.id
        end.to change(Activity, :count).from(0).to(1)
      end

      it 'has the correct action' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.action).to eq 'added'
      end

      it 'has the correct target' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.target).to eq 'checklist_item'
      end

      it 'has the correct data' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.data).to include(
          text: 'test',
          state: 'incomplete',
          checklist: 'Some checklist'
        )
      end
    end

    context 'remove checklist item' do
      let(:data) { webhook_fixture 'remove_checklist_item' }

      it 'creates an activity' do
        expect do
          post :webhook, data, format: :json, type: 'card', id: idea.id
        end.to change(Activity, :count).from(0).to(1)
      end

      it 'has the correct action' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.action).to eq 'removed'
      end

      it 'has the correct target' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.target).to eq 'checklist_item'
      end

      it 'has the correct data' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.data).to include(
          text: 'test',
          state: 'incomplete'
        )
      end
    end

    context 'update checklist item' do
      let(:data) { webhook_fixture 'update_checklist_item' }

      it 'creates an activity' do
        expect do
          post :webhook, data, format: :json, type: 'card', id: idea.id
        end.to change(Activity, :count).from(0).to(1)
      end

      it 'has the correct action' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.action).to eq 'updated'
      end

      it 'has the correct target' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.target).to eq 'checklist_item'
      end

      it 'has the correct data' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.data).to include(
          text: 'test',
          state: 'complete'
        )
      end
    end

    context 'add comment' do
      let(:data) { webhook_fixture 'add_comment' }

      it 'creates an activity' do
        expect do
          post :webhook, data, format: :json, type: 'card', id: idea.id
        end.to change(Activity, :count).from(0).to(1)
      end

      it 'has the correct action' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.action).to eq 'added'
      end

      it 'has the correct target' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.target).to eq 'comment'
      end

      it 'has the correct data' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.data).to include(
          text: 'This is a test comment for testing purposes.'
        )
      end

      it 'creates a comment' do
        expect do
          post :webhook, data, format: :json, type: 'card', id: idea.id
        end.to change(idea.comments, :count).from(0).to(1)

        comment = idea.comments.last
        expect(comment.text).to eq(
          'This is a test comment for testing purposes.'
        )
        expect(comment.comment_id).to eq('564d188310e524a228bda08d')
      end
    end

    context 'remove comment' do
      let(:data) { webhook_fixture 'remove_comment' }

      it 'creates an activity' do
        expect do
          post :webhook, data, format: :json, type: 'card', id: idea.id
        end.to change(Activity, :count).from(0).to(1)
      end

      it 'has the correct action' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.action).to eq 'removed'
      end

      it 'has the correct target' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.target).to eq 'comment'
      end

      it 'removes the comment' do
        create :comment, idea: idea, action_id: '564d188310e524a228bda08d'

        expect do
          post :webhook, data, format: :json, type: 'card', id: idea.id
        end.to change(Comment, :count).from(1).to(0)
      end
    end

    context 'add label' do
      let(:data) { webhook_fixture 'add_label' }

      it 'creates an activity' do
        expect do
          post :webhook, data, format: :json, type: 'card', id: idea.id
        end.to change(Activity, :count).from(0).to(1)
      end

      it 'has the correct action' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.action).to eq 'added'
      end

      it 'has the correct target' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.target).to eq 'label'
      end

      it 'has the correct data' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.data).to include(
          text: 'Green!',
          color: 'green'
        )
      end
    end

    context 'remove label' do
      let(:data) { webhook_fixture 'remove_label' }

      it 'creates an activity' do
        expect do
          post :webhook, data, format: :json, type: 'card', id: idea.id
        end.to change(Activity, :count).from(0).to(1)
      end

      it 'has the correct action' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.action).to eq 'removed'
      end

      it 'has the correct target' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.target).to eq 'label'
      end

      it 'has the correct data' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.data).to include(
          text: 'Green!',
          color: 'green'
        )
      end
    end

    context 'add member' do
      let(:data) { webhook_fixture 'add_member' }

      it 'creates an activity' do
        expect do
          post :webhook, data, format: :json, type: 'card', id: idea.id
        end.to change(Activity, :count).from(0).to(1)
      end

      it 'has the correct action' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.action).to eq 'added'
      end

      it 'has the correct target' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.target).to eq 'member'
      end

      it 'has the correct data' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.data).to include(
          text: 'Zoee Silcock'
        )
      end
    end

    context 'remove member' do
      let(:data) { webhook_fixture 'remove_member' }

      it 'creates an activity' do
        expect do
          post :webhook, data, format: :json, type: 'card', id: idea.id
        end.to change(Activity, :count).from(0).to(1)
      end

      it 'has the correct action' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.action).to eq 'removed'
      end

      it 'has the correct target' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.target).to eq 'member'
      end

      it 'has the correct data' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.data).to include(
          text: 'Zoee Silcock'
        )
      end
    end

    context 'move card' do
      let(:data) { webhook_fixture 'move_to_list' }

      it 'creates an activity' do
        expect do
          post :webhook, data, format: :json, type: 'card', id: idea.id
        end.to change(Activity, :count).from(0).to(1)
      end

      it 'has the correct action' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.action).to eq 'moved'
      end

      it 'has the correct target' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.target).to eq 'card'
      end

      it 'has the correct data' do
        post :webhook, data, format: :json, type: 'card', id: idea.id
        expect(Activity.last.data).to include(
          fromList: 'Inbox',
          toList: 'Requirements'
        )
      end

      it 'updates the list id of the idea' do
        expect do
          post :webhook, data, format: :json, type: 'card', id: idea.id
        end.to change { idea.reload.list_id }.to('5631f211bd6a8ea56c5a7150')
      end
    end
  end
end
