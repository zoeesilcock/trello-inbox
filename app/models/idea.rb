class Idea < ActiveRecord::Base
  belongs_to :inbox
  belongs_to :user

  validates :title, presence: true
  validates :inbox, presence: true
  validates :user, presence: true

  after_create :create_in_trello

  private

  def create_in_trello
    card = Trello::Card.create(
      name: title,
      desc: description,
      list_id: inbox.board.lists.first.id
    )

    self.card_id = card.id
    save
  end
end
