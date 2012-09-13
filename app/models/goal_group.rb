class GoalGroup < ActiveRecord::Base
  belongs_to :card
  belongs_to :effect_type
  attr_accessible :required_count
end
