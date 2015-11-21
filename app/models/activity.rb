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

  validates :user_name, presence: true
  validates :target, presence: true
  validates :action, presence: true

  def data
    JSON.parse(self[:data]).with_indifferent_access
  end
end
