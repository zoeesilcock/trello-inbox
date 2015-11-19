require 'rails_helper'

RSpec.describe Idea, type: :model do
  let(:idea) { build :idea }

  describe 'validations' do
    it 'requires a title' do
      idea.title = nil
      expect(idea).not_to be_valid
    end

    it 'requires a description' do
      idea.description = nil
      expect(idea).not_to be_valid
    end

    it 'requires an inbox' do
      idea.inbox_id = nil
      expect(idea).not_to be_valid
    end

    it 'requires a user' do
      idea.user_id = nil
      expect(idea).not_to be_valid
    end
  end

  describe 'callbacks' do
    let(:board) { double(:board, lists: [double(:list, id: '1')]) }
    let(:card) { double(:card, id: 'trello_card_id', name: '', desc: '') }

    context 'create' do
      before do
        allow(idea).to receive(:update_in_trello)
      end

      it 'creates the card in trello' do
        expect(Trello::Board).to receive(:find).and_return(board)
        expect(Trello::Card).to receive(:create).with(
          hash_including(
            name: idea.title,
            desc: idea.description
          )
        ).and_return(card)

        idea.save
      end

      it 'saves the trello card id' do
        expect(Trello::Board).to receive(:find).and_return(board)
        expect(Trello::Card).to receive(:create).and_return(card)

        idea.save

        expect(idea.card_id).to eq(card.id)
      end
    end

    context 'update' do
      let(:new_title) { 'Some other title' }
      let(:new_description) { 'A newer, fresher description.' }

      it 'updates the card in trello' do
        expect(idea).to receive(:create_in_trello)
        idea.save

        expect(Trello::Card).to receive(:find).and_return(card)
        expect(card).to receive(:name=).with(new_title)
        expect(card).to receive(:desc=).with(new_description)
        expect(card).to receive(:save)

        idea.update_attributes title: new_title, description: new_description
      end
    end
  end

  describe '#create_webhook' do
    it 'creates a webhook in trello' do
      expect(Trello::Webhook).to receive(:create).with(
        hash_including(
          id_model: idea.card_id
        )
      )

      idea.id = 1
      idea.create_webhook
    end
  end
end
