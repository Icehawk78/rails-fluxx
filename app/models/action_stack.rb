class ActionStack < ActiveRecord::Base
  acts_as_nested_set
  belongs_to :deck_card
  belongs_to :effect_type
  belongs_to :game
  belongs_to :player
  attr_accessible :parameter_json
end
