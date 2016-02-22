class Inbox < ActiveRecord::Base
  belongs_to :user
  has_many :ideas
  has_many :fields
  has_many :lists

  validates :title, presence: true
  validates :board_id, presence: true
  validates :user, presence: true

  def board
    @board ||= Trello::Board.find(board_id)
  end

  def create_lists
    board.lists.each do |l|
      list = lists.find_by_list_id l.id

      if list
        list.update_attribute :title, l.name
      else
        List.create(inbox: self, title: l.name, list_id: l.id)
      end
    end
  end
end
