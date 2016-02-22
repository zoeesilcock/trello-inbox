class List < ActiveRecord::Base
  validates :list_id, presence: true
  validates :title, presence: true
end
