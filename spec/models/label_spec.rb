require 'rails_helper'

RSpec.describe Label, type: :model do
  let(:label) { build :label }

  describe 'associations' do
    let(:idea1) { create :idea }
    let(:idea2) { create :idea }

    before do
      label.ideas << idea1
      label.ideas << idea2
    end

    it 'can belong to multiple ideas' do
      expect(label.ideas.first).to eq idea1
      expect(label.ideas.last).to eq idea2
    end
  end
end
