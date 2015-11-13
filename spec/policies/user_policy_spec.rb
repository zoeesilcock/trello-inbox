require 'rails_helper'

describe UserPolicy do

  let(:user) { build :user }
  let(:admin) { build :admin }

  subject { described_class }

  permissions '.scope' do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :index? do
    it 'does not allow users to list users' do
      expect(subject).not_to permit(user)
    end

    it 'allows admins to list users' do
      expect(subject).to permit(admin)
    end
  end

  permissions :show? do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :create? do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :update? do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :destroy? do
    pending "add some examples to (or delete) #{__FILE__}"
  end
end
