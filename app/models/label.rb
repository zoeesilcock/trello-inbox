class Label < ActiveRecord::Base
  has_many :ideas, through: :ideas_labels
  has_many :ideas_labels
end
