require 'rails_helper'

describe IdeaPolicy do
  let(:user) { build :user }
  let(:own_idea) { build :idea, user: user }
  let(:others_idea) { build :idea }

  subject { described_class }

  permissions '.scope' do
    let(:ideas) { create_list(:idea, 2) }

    before do
      allow_any_instance_of(Idea).to receive(:create_in_trello)
    end

    it 'includes all ideas' do
      expect(Pundit.policy_scope(user, Idea).all).to match_array ideas
    end
  end

  permissions :show? do
    it 'allows users to see ideas' do
      expect(subject).to permit(user)
    end
  end

  permissions :new? do
    it 'allows users to create ideas' do
      expect(subject).to permit(user)
    end
  end

  permissions :create? do
    it 'allows users to create ideas' do
      expect(subject).to permit(user)
    end
  end

  permissions :edit? do
    it 'does not allow users to edit ideas they do not own' do
      expect(subject).not_to permit(user, others_idea)
    end

    it 'allows users to edit ideas that they own' do
      expect(subject).to permit(user, own_idea)
    end
  end

  permissions :update? do
    it 'does not allow users to update ideas they do not own' do
      expect(subject).not_to permit(user, others_idea)
    end

    it 'allows users to update ideas that they own' do
      expect(subject).to permit(user, own_idea)
    end
  end

  permissions :destroy? do
    it 'does not allow users to destroy ideas they do not own' do
      expect(subject).not_to permit(user, others_idea)
    end

    it 'allows users to edit destroy that they own' do
      expect(subject).to permit(user, own_idea)
    end
  end
end
