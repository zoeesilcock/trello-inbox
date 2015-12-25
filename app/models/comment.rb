class Comment < ActiveRecord::Base
  belongs_to :idea
  validates :text, presence: true

  def create_in_trello(user)
    card = Trello::Card.find idea.card_id
    header = I18n.t('comments.used_trello_inbox_to_say')
    comment = card.add_comment "#{user.name} #{header}:\n\n#{text}"
    self.comment_id = JSON.parse(comment)['id']
    save
  end
end
