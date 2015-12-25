require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { build :comment }

  before do
    allow_any_instance_of(Idea).to receive(:create_in_trello)
  end

  describe 'validations' do
    it 'requires text' do
      comment.text = nil
      expect(comment).not_to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to an idea' do
      expect(comment.idea).to be_an Idea
    end
  end

  describe '#create_in_trello' do
    let(:user) { build :user }
    let(:card) { double :card }
    let(:trello_comment) { '{ "id": "trello_id" }' }

    it 'creates a comment using the Trello API' do
      expect(Trello::Card).to receive(:find).and_return(card)

      expect(card).to receive(:add_comment).with(anything) do |text|
        expect(text).to include user.name
        expect(text).to include comment.text
      end.and_return(trello_comment)

      comment.create_in_trello(user)
    end
  end
end
