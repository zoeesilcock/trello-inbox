require 'rails_helper'

RSpec.describe Inbox, type: :model do
  context 'without a title' do
    Given(:invalid_inbox) { build :inbox, title: nil }
    Then { expect(invalid_inbox).not_to be_valid }
  end

  context 'without a trello board id' do
    Given(:invalid_inbox) { build :inbox, board_id: nil }
    Then { expect(invalid_inbox).not_to be_valid }
  end

  context 'without a trello board id' do
    Given(:invalid_inbox) { build :inbox, user_id: nil }
    Then { expect(invalid_inbox).not_to be_valid }
  end
end
