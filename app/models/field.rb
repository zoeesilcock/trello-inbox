class Field < ActiveRecord::Base
  belongs_to :inbox
  validates :title, presence: true
end
