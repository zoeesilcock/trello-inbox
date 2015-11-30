class Activity < ActiveRecord::Base
  enum target: [
    :attachment,
    :checklist,
    :checklist_item,
    :comment,
    :label,
    :member
  ]

  enum action: [
    :added,
    :removed,
    :updated,
    :moved
  ]

  belongs_to :idea

  validates :user_name, presence: true
  validates :target, presence: true
  validates :action, presence: true

  after_create :create_or_destroy_comment

  def data
    JSON.parse(self[:data]).with_indifferent_access
  end

  private

  def create_or_destroy_comment
    if added? && comment?
      create_comment
    elsif removed? && comment?
      destroy_comment
    end
  end

  def create_comment
    Comment.create(
      action_id: action_id,
      user_name: user_name,
      user_avatar: user_avatar,
      text: data['text'],
      idea_id: idea_id
    )
  end

  def destroy_comment
    Comment.find_by_action_id(data['remove_id']).try(:destroy)
  end
end
