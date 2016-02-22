class List < ActiveRecord::Base
  belongs_to :inbox

  validates :list_id, presence: true
  validates :title, presence: true
end
