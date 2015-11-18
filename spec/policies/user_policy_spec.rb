require 'rails_helper'

describe UserPolicy do
  let(:user) { build :user }
  let(:admin) { build :admin }

  subject { described_class }

  permissions :index? do
    it 'does not allow users to list users' do
      expect(subject).not_to permit(user)
    end

    it 'allows admins to list users' do
      expect(subject).to permit(admin)
    end
  end

  permissions :update? do
    it 'does not allow users to update users' do
      expect(subject).not_to permit(user)
    end

    it 'allows admins to update users' do
      expect(subject).to permit(admin)
    end
  end
end
