require 'rails_helper'

RSpec.describe IdeasLabel, type: :model do
  let(:ideas_label) { build :ideas_label }

  before do
    allow_any_instance_of(Idea).to receive(:create_in_trello)
  end

  it 'belongs to an idea' do
    expect(ideas_label.idea).to be_a Idea
  end

  it 'belongs to a label' do
    expect(ideas_label.label).to be_a Label
  end
end
