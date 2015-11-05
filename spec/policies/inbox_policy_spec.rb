require 'rails_helper'

describe InboxPolicy do

  let(:user) { build :user }
  let(:creator) { build :creator }
  let(:creators_inbox) { build :inbox, user: creator }
  let(:others_inbox) { build :inbox }

  subject { described_class }

  permissions '.scope' do
    pending 'add some examples to (or delete) #{__FILE__}'
  end

  permissions :show? do
    it 'allows users to see inboxes' do
      expect(subject).to permit(user)
    end
  end

  permissions :new? do
    it 'does not allow users to create inboxes' do
      expect(subject).not_to permit(user)
    end

    it 'allows creators to create inboxes' do
      expect(subject).to permit(creator)
    end
  end

  permissions :create? do
    it 'does not allow users to create inboxes' do
      expect(subject).not_to permit(user)
    end

    it 'allows creators to create inboxes' do
      expect(subject).to permit(creator)
    end
  end

  permissions :edit? do
    it 'does not allow users to edit inboxes' do
      expect(subject).not_to permit(user)
    end

    it 'does not allow creators to edit inboxes they do not own' do
      expect(subject).not_to permit(creator, others_inbox)
    end

    it 'allows creators to edit inboxes that they own' do
      expect(subject).to permit(creator, creators_inbox)
    end
  end

  permissions :update? do
    it 'does not allow users to update inboxes' do
      expect(subject).not_to permit(user)
    end

    it 'does not allow creators to update inboxes they do not own' do
      expect(subject).not_to permit(creator, others_inbox)
    end

    it 'allows creators to update inboxes that they own' do
      expect(subject).to permit(creator, creators_inbox)
    end
  end

  permissions :destroy? do
    it 'does not allow users to destroy inboxes' do
      expect(subject).not_to permit(user)
    end

    it 'does not allow creators to destroy inboxes they do not own' do
      expect(subject).not_to permit(creator, others_inbox)
    end

    it 'allows creators to destroy inboxes that they own' do
      expect(subject).to permit(creator, creators_inbox)
    end
  end
end
