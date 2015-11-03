require 'rails_helper'

RSpec.describe Idea, type: :model do
  let (:idea) { build :idea }

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

  describe 'callbacks' do
    let (:board) { double(:board, lists: [double(:list, id: "1")]) }
    let (:card) { double(:card, id: "trello_card_id") }

    it 'creates the card in trello' do
      expect(Trello::Board).to receive(:find).and_return(board)
      expect(Trello::Card).to receive(:create).with(hash_including(
        name: idea.title,
        desc: idea.description
      )).and_return(card)

      idea.save
    end

    it 'saves the trello card id' do
      expect(Trello::Board).to receive(:find).and_return(board)
      expect(Trello::Card).to receive(:create).and_return(card)

      idea.save

      expect(idea.card_id).to eq(card.id)
    end
  end
end
