require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { build :comment }

  before do
    allow_any_instance_of(Idea).to receive(:create_in_trello)
  end

  it 'belongs to an idea' do
    expect(comment.idea).to be_a Idea
  end
end
