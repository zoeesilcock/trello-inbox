class Inbox < ActiveRecord::Base
  belongs_to :user
  has_many :ideas

  validates :title, presence: true
  validates :board_id, presence: true
  validates :user, presence: true

  def board
    Trello::Board.find(board_id)
  end
end
