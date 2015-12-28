require 'rails_helper'

RSpec.describe Field, type: :model do
  let(:field) { build :field }

  describe 'associations' do
    it 'belongs to an inbox' do
      field.inbox = build :inbox
      expect(field.inbox).to be_an Inbox
    end
  end

  describe 'validations' do
    it 'requires a title' do
      field.title = nil
      expect(field).not_to be_valid
    end
  end
end
