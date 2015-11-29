class IdeasLabel < ActiveRecord::Base
  belongs_to :idea
  belongs_to :label
end
