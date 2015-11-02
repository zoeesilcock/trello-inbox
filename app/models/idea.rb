class Idea < ActiveRecord::Base
  belongs_to :inbox
  validates :title, presence: true
  validates :inbox, presence: true
  after_create :create_in_trello

  private

  def create_in_trello
    Trello::Card.create(
      name: title,
      desc: description,
      list_id: inbox.board.lists.first.id
    )
  end
end
