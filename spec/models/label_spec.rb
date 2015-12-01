require 'rails_helper'

RSpec.describe Label, type: :model do
  let(:label) { build :label }
  let(:idea1) { create :idea }
  let(:idea2) { create :idea }

  before do
    allow_any_instance_of(Idea).to receive(:create_in_trello)

    label.ideas << idea1
    label.ideas << idea2
  end

  it 'can belong to multiple ideas' do
    expect(label.ideas.first).to eq idea1
    expect(label.ideas.last).to eq idea2
  end
end
