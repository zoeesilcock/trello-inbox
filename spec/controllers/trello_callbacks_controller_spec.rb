require 'rails_helper'

RSpec.describe TrelloCallbacksController, type: :controller do
  describe 'POST #webhook' do
    let(:data) { File.read('webhook_data/webhook_add_comment.json') }

    it 'responds successfully with an HTTP 200 status code' do
      post :webhook, data, format: :json, type: 'card', id: 1
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    context 'add attachment' do
      let(:data) { File.read('webhook_data/webhook_add_attachment.json') }

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
      let(:data) { File.read('webhook_data/webhook_remove_attachment.json') }

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
      let(:data) { File.read('webhook_data/webhook_add_checklist.json') }

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
      let(:data) { File.read('webhook_data/webhook_remove_checklist.json') }

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
    context 'add comment' do
      let(:data) { File.read('webhook_data/webhook_add_comment.json') }

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
      let(:data) { File.read('webhook_data/webhook_remove_comment.json') }

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
      let(:data) { File.read('webhook_data/webhook_add_label.json') }

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
      let(:data) { File.read('webhook_data/webhook_remove_label.json') }

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
      let(:data) { File.read('webhook_data/webhook_add_member.json') }

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
      let(:data) { File.read('webhook_data/webhook_remove_member.json') }

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
