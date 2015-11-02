require 'rails_helper'

RSpec.describe Idea, type: :model do
  let (:idea) { build :idea }

  it 'requires a title' do
    idea.title = nil
    expect(idea).not_to be_valid
  end

  it 'requires an inbox' do
    idea.inbox_id = nil
    expect(idea).not_to be_valid
  end
end
