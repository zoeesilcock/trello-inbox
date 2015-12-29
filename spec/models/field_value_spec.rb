require 'rails_helper'

RSpec.describe FieldValue, type: :model do
  let(:field_value) { build :field_value }

  before do
    allow_any_instance_of(Idea).to receive(:create_in_trello)
  end

  describe 'validations' do
    it 'requires a field' do
      field_value.field = nil
      expect(field_value).not_to be_valid
    end

    it 'requires an idea' do
      field_value.idea = nil
      expect(field_value).not_to be_valid
    end

    it 'requires a value' do
      field_value.value = nil
      expect(field_value).not_to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a field' do
      expect(field_value.field).to be_a Field
    end

    it 'belongs to an idea' do
      expect(field_value.idea).to be_an Idea
    end
  end
end
