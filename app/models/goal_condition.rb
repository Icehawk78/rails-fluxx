class GoalCondition < ActiveRecord::Base
  belongs_to :goal_group
  belongs_to :goal_entity
  attr_accessible :entity_id
  # attr_accessible :title, :body
end
