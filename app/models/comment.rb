class Comment < ActiveRecord::Base
  belongs_to :idea
  validates :text, presence: true

  def self.header
    I18n.t('comments.used_trello_inbox_to_say')
  end

  def self.remove_header(text)
    text.gsub(/.* #{Comment.header}\:\n\n/, '') if text
  end

  def create_in_trello(user)
    card = Trello::Card.find idea.card_id
    comment = card.add_comment "#{user.name} #{Comment.header}:\n\n#{text}"
    self.comment_id = JSON.parse(comment)['id']
    save
  end

  def text
    Comment.remove_header self[:text]
  end

  def avatar
    if user_avatar =~ %r{https?\:\/\/}
      user_avatar
    else
      "https://trello-avatars.s3.amazonaws.com/#{user_avatar}/170.png"
    end
  end
end
