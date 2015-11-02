class Inbox < ActiveRecord::Base
  validates :title, presence: true
  validates :board_id, presence: true
end
