class Activity < ActiveRecord::Base
  validates :user_name, presence: true
  validates :target, presence: true
  validates :action, presence: true
end
