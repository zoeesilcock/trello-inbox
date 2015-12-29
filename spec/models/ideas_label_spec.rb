require 'rails_helper'

RSpec.describe IdeasLabel, type: :model do
  let(:ideas_label) { build :ideas_label }

  describe 'associations' do
    it 'belongs to an idea' do
      expect(ideas_label.idea).to be_an Idea
    end

    it 'belongs to a label' do
      expect(ideas_label.label).to be_a Label
    end
  end
end
