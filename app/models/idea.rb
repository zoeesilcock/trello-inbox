class Idea < ActiveRecord::Base
  belongs_to :inbox
  belongs_to :user
  has_many :activities, -> { order 'created_at DESC' }
  has_many :comments, -> { order 'created_at DESC' }
  has_many :labels, -> { uniq }, through: :ideas_labels
  has_many :ideas_labels

  validates :title, presence: true
  validates :description, presence: true
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
    create_webhook
  end

  def update_in_trello
    return unless changes.keys & [:title, :description]

    card = Trello::Card.find card_id
    card.name = title
    card.desc = description
    card.save
  end

  def callback_url
    path = Rails.application.routes.url_helpers.trello_callback_path('card', id)
    "#{ENV['WEBHOOK_DOMAIN']}#{path}"
  end
end
