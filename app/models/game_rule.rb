class GameRule < ActiveRecord::Base
  # Replaces existing if the following properties match:
  #  game, effect_type, change_type, condition_code
  belongs_to :game, :inverse_of => :game_rules
  belongs_to :player, :inverse_of => :game_rules
  belongs_to :deck_card
  belongs_to :effect_type
  attr_accessible :effect_type, :change_type, :condition_code, :parameter_json, :default_parameter_json
end
