class Idea < ActiveRecord::Base
  belongs_to :inbox
  belongs_to :user

  validates :title, presence: true
  validates :inbox, presence: true
  validates :user, presence: true

  after_create :create_in_trello
  after_update :update_in_trello

  def create_webhook
    Trello::Webhook.create id_model: card_id, callback_url: callback_url
  end

  private

  def create_in_trello
    card = Trello::Card.create(
      name: title,
      desc: description,
      list_id: inbox.board.lists.first.id,
      pos: 'bottom'
    )

    update_attribute :card_id, card.id
  end

  def update_in_trello
    return unless changes.keys & [:title, :description]

    card = Trello::Card.find card_id
    card.name = title
    card.desc = description
    card.save
  end

  def callback_url
    "#{ENV['WEBHOOK_DOMAIN']}#{Rails.application.routes.url_helpers.trello_callback_path('card', id)}"
  end
end
