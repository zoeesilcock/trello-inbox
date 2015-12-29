require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { build :comment }

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

  describe '#text' do
    it 'removes the header' do
      comment.text = "Some weirdo used Trello Inbox to say:\n\nHello :)"
      expect(comment.text).to eq('Hello :)')
    end
  end

  describe '#avatar' do
    context 'with a trello hash avatar' do
      it 'adds the trello avatar url' do
        comment.user_avatar = '12a4f0297fe2ecb7275048e89c47ec8f'
        expect(comment.avatar).to include('trello-avatars.s3.amazonaws.com')
      end
    end

    context 'with a URL avatar' do
      let(:url) { 'https://some-service.com/my_avatar.jpg' }

      it 'returns the url as it appears on the model' do
        comment.user_avatar = url
        expect(comment.avatar).to eq(url)
      end
    end
  end
end
