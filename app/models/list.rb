class List < ActiveRecord::Base
  belongs_to :inbox
  has_many :ideas

  self.primary_key = 'list_id'

  validates :list_id, presence: true
  validates :title, presence: true
end
