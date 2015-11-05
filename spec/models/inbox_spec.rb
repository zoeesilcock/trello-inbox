require 'rails_helper'

RSpec.describe Inbox, type: :model do
  let(:inbox) { build :inbox }

  it 'requires a title' do
    inbox.title = nil
    expect(inbox).not_to be_valid
  end

  it 'requires a trello board id' do
    inbox.board_id = nil
    expect(inbox).not_to be_valid
  end

  it 'requires a user' do
    inbox.user_id = nil
    expect(inbox).not_to be_valid
  end
end
