class Idea < ActiveRecord::Base
  belongs_to :inbox
  validates :title, presence: true
  validates :inbox, presence: true
end
