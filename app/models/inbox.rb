class Inbox < ActiveRecord::Base
  validates :title, presence: true
  validates :board_id, presence: true

  def board
    Trello::Board.find(board_id)
  end
end
