require 'rails_helper'

describe ApplicationPolicy do
  let(:user) { build :user }

  subject { described_class }

  permissions '.scope' do
    let(:inboxes) { create_list(:inbox, 2) }

    it 'includes all records' do
      expect(Pundit.policy_scope(user, Inbox).all).to match_array inboxes
    end
  end

  permissions :index? do
    it 'allows users to list things by default' do
      expect(subject).to permit(user)
    end
  end

  permissions :show? do
    let(:inbox) { create :inbox }

    it 'allows users to show things that are persisted by default' do
      expect(subject).to permit(user, inbox)
    end
  end

  permissions :new? do
    it 'does not allow users to create things by default' do
      expect(subject).not_to permit(user)
    end
  end

  permissions :create? do
    it 'does not allow users to create things by default' do
      expect(subject).not_to permit(user)
    end
  end

  permissions :edit? do
    it 'does not allow users to edit things by default' do
      expect(subject).not_to permit(user)
    end
  end

  permissions :update? do
    it 'does not allow users to edit things by default' do
      expect(subject).not_to permit(user)
    end
  end

  permissions :destroy? do
    it 'does not allow users to delete things by default' do
      expect(subject).not_to permit(user)
    end
  end
end
