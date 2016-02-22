require 'rails_helper'

RSpec.describe Idea, type: :model do
  let(:idea) { build :idea }

  describe 'associations' do
    context 'activities' do
      let(:activity1) { build :activity }
      let(:activity2) { build :activity }

      before do
        idea.activities << activity1
        idea.activities << activity2
      end

      it 'can have multiple activites' do
        expect(idea.activities.first).to eq activity1
        expect(idea.activities.last).to eq activity2
      end
    end

    context 'comments' do
      let(:comment1) { build :comment, idea: nil }
      let(:comment2) { build :comment, idea: nil }

      before do
        idea.comments << comment1
        idea.comments << comment2
      end

      it 'can have multiple comments' do
        expect(idea.comments.first).to eq comment1
        expect(idea.comments.last).to eq comment2
      end
    end

    context 'labels' do
      let(:label1) { build :label }
      let(:label2) { build :label }

      before do
        idea.labels << label1
        idea.labels << label2
      end

      it 'can have multiple labels' do
        expect(idea.labels.first).to eq label1
        expect(idea.labels.last).to eq label2
      end
    end
  end

  describe 'validations' do
    it 'requires a title' do
      idea.title = nil
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

  describe 'trello integration' do
    let(:lists) { [double(:list, id: '1', name: 'My Inbox')] }
    let(:board) { double(:board, lists: lists) }
    let(:card) { double(:card, id: 'trello_card_id', name: '', desc: '') }
    let(:idea) { create :idea }
    let(:description) { 'Description of the idea.' }
    let!(:field) { create :field, title: 'Description', inbox: idea.inbox }
    let!(:field_value) do
      create :field_value, field: field, idea: idea, value: description
    end

    context 'create_in_trello' do
      before do
        allow(idea).to receive(:create_webhook)
      end

      it 'creates the card in trello' do
        expect(Trello::Board).to receive(:find).and_return(board)
        expect(Trello::Card).to receive(:create) do |data|
          expect(data[:name]).to eq(idea.title)
          expect(data[:desc]).to include(description)
        end.and_return(card)

        idea.create_in_trello
      end

      it 'saves the trello card id' do
        expect(Trello::Board).to receive(:find).and_return(board)
        expect(Trello::Card).to receive(:create).and_return(card)

        idea.create_in_trello

        expect(idea.card_id).to eq(card.id)
      end

      it 'saves the trello list id' do
        expect(Trello::Board).to receive(:find).and_return(board)
        expect(Trello::Card).to receive(:create).and_return(card)

        idea.create_in_trello

        expect(idea.list_id).to eq(lists.first.id)
      end
    end

    context 'update_in_trello' do
      let(:new_title) { 'Some other title' }
      let(:new_description) { 'A newer, fresher description.' }

      it 'updates the card in trello' do
        expect(Trello::Card).to receive(:find).and_return(card)
        expect(card).to receive(:name=).with(new_title)
        expect(card).to receive(:desc=) do |description|
          expect(description).to include(new_description)
        end
        expect(card).to receive(:save)

        idea.update_attributes title: new_title
        field_value.update_attributes value: new_description
        idea.update_in_trello
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
