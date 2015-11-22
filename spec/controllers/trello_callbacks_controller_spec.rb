require 'rails_helper'

RSpec.describe TrelloCallbacksController, type: :controller do
  describe 'POST #webhook' do
    let(:data) { webhook_fixture 'add_comment' }

    it 'responds successfully with an HTTP 200 status code' do
      post :webhook, data, format: :json, type: 'card', id: 1
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    describe 'association to idea' do
      let(:idea) { build :idea, card_id: 'some_card_id' }

      before do
        allow(idea).to receive(:create_in_trello)
        idea.save
      end

      it 'hooks the activity up to the idea' do
        post :webhook, data, format: :json, type: 'card', id: idea.card_id
        expect(Activity.last.idea_id).to eq idea.id
      end
    end

    context 'add attachment' do
      let(:data) { webhook_fixture 'add_attachment' }

      it 'creates an activity' do
        expect do
          post :webhook, data, format: :json, type: 'card', id: 1
        end.to change(Activity, :count).from(0).to(1)
      end

      it 'has the correct action' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.action).to eq 'added'
      end

      it 'has the correct target' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.target).to eq 'attachment'
      end

      it 'has the correct data' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.data).to include(
          name: 'favicon.ico',
          preview: 'https://example.com/image.png'
        )
      end
    end

    context 'remove attachment' do
      let(:data) { webhook_fixture 'remove_attachment' }

      it 'creates an activity' do
        expect do
          post :webhook, data, format: :json, type: 'card', id: 1
        end.to change(Activity, :count).from(0).to(1)
      end

      it 'has the correct action' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.action).to eq 'removed'
      end

      it 'has the correct target' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.target).to eq 'attachment'
      end

      it 'has the correct data' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.data).to include(
          name: 'favicon.ico'
        )
      end
    end

    context 'add checklist' do
      let(:data) { webhook_fixture 'add_checklist' }

      it 'creates an activity' do
        expect do
          post :webhook, data, format: :json, type: 'card', id: 1
        end.to change(Activity, :count).from(0).to(1)
      end

      it 'has the correct action' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.action).to eq 'added'
      end

      it 'has the correct target' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.target).to eq 'checklist'
      end

      it 'has the correct data' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.data).to include(
          name: 'Some checklist'
        )
      end
    end

    context 'remove checklist' do
      let(:data) { webhook_fixture 'remove_checklist' }

      it 'creates an activity' do
        expect do
          post :webhook, data, format: :json, type: 'card', id: 1
        end.to change(Activity, :count).from(0).to(1)
      end

      it 'has the correct action' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.action).to eq 'removed'
      end

      it 'has the correct target' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.target).to eq 'checklist'
      end

      it 'has the correct data' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.data).to include(
          name: 'Some checklist'
        )
      end
    end

    context 'add checklist item' do
      let(:data) { webhook_fixture 'add_checklist_item' }

      it 'creates an activity' do
        expect do
          post :webhook, data, format: :json, type: 'card', id: 1
        end.to change(Activity, :count).from(0).to(1)
      end

      it 'has the correct action' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.action).to eq 'added'
      end

      it 'has the correct target' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.target).to eq 'checklist_item'
      end

      it 'has the correct data' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.data).to include(
          text: 'test',
          completed: false
        )
      end
    end

    context 'remove checklist item' do
      let(:data) { webhook_fixture 'remove_checklist_item' }

      it 'creates an activity' do
        expect do
          post :webhook, data, format: :json, type: 'card', id: 1
        end.to change(Activity, :count).from(0).to(1)
      end

      it 'has the correct action' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.action).to eq 'removed'
      end

      it 'has the correct target' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.target).to eq 'checklist_item'
      end

      it 'has the correct data' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.data).to include(
          text: 'test',
          completed: false
        )
      end
    end

    context 'update checklist item' do
      let(:data) { webhook_fixture 'update_checklist_item' }

      it 'creates an activity' do
        expect do
          post :webhook, data, format: :json, type: 'card', id: 1
        end.to change(Activity, :count).from(0).to(1)
      end

      it 'has the correct action' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.action).to eq 'updated'
      end

      it 'has the correct target' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.target).to eq 'checklist_item'
      end

      it 'has the correct data' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.data).to include(
          text: 'test',
          completed: true
        )
      end
    end

    context 'add comment' do
      let(:data) { webhook_fixture 'add_comment' }

      it 'creates an activity' do
        expect do
          post :webhook, data, format: :json, type: 'card', id: 1
        end.to change(Activity, :count).from(0).to(1)
      end

      it 'has the correct action' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.action).to eq 'added'
      end

      it 'has the correct target' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.target).to eq 'comment'
      end

      it 'has the correct data' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.data).to include(
          text: 'This is a test comment for testing purposes.'
        )
      end
    end

    context 'remove comment' do
      let(:data) { webhook_fixture 'remove_comment' }

      it 'creates an activity' do
        expect do
          post :webhook, data, format: :json, type: 'card', id: 1
        end.to change(Activity, :count).from(0).to(1)
      end

      it 'has the correct action' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.action).to eq 'removed'
      end

      it 'has the correct target' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.target).to eq 'comment'
      end
    end

    context 'add label' do
      let(:data) { webhook_fixture 'add_label' }

      it 'creates an activity' do
        expect do
          post :webhook, data, format: :json, type: 'card', id: 1
        end.to change(Activity, :count).from(0).to(1)
      end

      it 'has the correct action' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.action).to eq 'added'
      end

      it 'has the correct target' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.target).to eq 'label'
      end

      it 'has the correct data' do
        post :webhook, data, format: :json, type: 'card', id: 1
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
          post :webhook, data, format: :json, type: 'card', id: 1
        end.to change(Activity, :count).from(0).to(1)
      end

      it 'has the correct action' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.action).to eq 'removed'
      end

      it 'has the correct target' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.target).to eq 'label'
      end

      it 'has the correct data' do
        post :webhook, data, format: :json, type: 'card', id: 1
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
          post :webhook, data, format: :json, type: 'card', id: 1
        end.to change(Activity, :count).from(0).to(1)
      end

      it 'has the correct action' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.action).to eq 'added'
      end

      it 'has the correct target' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.target).to eq 'member'
      end

      it 'has the correct data' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.data).to include(
          name: 'Zoee Silcock'
        )
      end
    end

    context 'remove member' do
      let(:data) { webhook_fixture 'remove_member' }

      it 'creates an activity' do
        expect do
          post :webhook, data, format: :json, type: 'card', id: 1
        end.to change(Activity, :count).from(0).to(1)
      end

      it 'has the correct action' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.action).to eq 'removed'
      end

      it 'has the correct target' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.target).to eq 'member'
      end

      it 'has the correct data' do
        post :webhook, data, format: :json, type: 'card', id: 1
        expect(Activity.last.data).to include(
          name: 'Zoee Silcock'
        )
      end
    end
  end
end
