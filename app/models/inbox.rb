class Inbox < ActiveRecord::Base
  has_many :ideas
  validates :title, presence: true
  validates :board_id, presence: true

  def board
    Trello::Board.find(board_id)
  end
end
