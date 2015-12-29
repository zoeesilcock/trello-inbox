class FieldValue < ActiveRecord::Base
  belongs_to :field
  belongs_to :idea

  validates :field, presence: true
  validates :idea, presence: true
  validates :value, presence: true
end
