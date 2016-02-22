require 'rails_helper'

RSpec.describe List, type: :model do
  let(:list) { build :list }

  describe 'validations' do
    it 'requires a trello list id' do
      list.list_id = nil
      expect(list).not_to be_valid
    end

    it 'requires a title' do
      list.title = nil
      expect(list).not_to be_valid
    end
  end
end
