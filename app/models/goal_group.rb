class GoalGroup < ActiveRecord::Base
  belongs_to :card
  attr_accessible :required_count
end
