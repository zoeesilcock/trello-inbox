require 'rails_helper'

RSpec.describe Inbox, type: :model do
  let(:inbox) { build :inbox }

  describe 'associations' do
    it 'belongs to a user' do
      inbox.user = build :user
      expect(inbox.user).to be_a User
    end

    context 'ideas' do
      let(:idea1) { build :idea }
      let(:idea2) { build :idea }

      before do
        inbox.ideas << idea1
        inbox.ideas << idea2
      end

      it 'can have multiple ideas' do
        expect(inbox.ideas.first).to eq idea1
        expect(inbox.ideas.last).to eq idea2
      end
    end

    context 'fields' do
      let(:field1) { build :field }
      let(:field2) { build :field }

      before do
        inbox.fields << field1
        inbox.fields << field2
      end

      it 'can have multiple fields' do
        expect(inbox.fields.first).to eq field1
        expect(inbox.fields.last).to eq field2
      end
    end

    context 'lists' do
      let(:list1) { build :list }
      let(:list2) { build :list }

      before do
        inbox.lists << list1
        inbox.lists << list2
      end

      it 'can have multiple lists' do
        expect(inbox.lists.first).to eq list1
        expect(inbox.lists.last).to eq list2
      end
    end
  end

  describe 'validations' do
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

  describe '#create_lists' do
    let(:list1) { double(:list, id: '1', name: 'List 1') }
    let(:list2) { double(:list, id: '2', name: 'List 2') }
    let(:lists) { [list1, list2] }
    let(:board) { double(:board, lists: lists) }

    before do
      inbox.save
    end

    it 'creates lists based on the board' do
      expect(Trello::Board).to receive(:find).and_return(board)

      inbox.create_lists

      expect(inbox.lists.first.list_id).to eq(list1.id)
      expect(inbox.lists.last.title).to eq(list2.name)
    end
  end
end
