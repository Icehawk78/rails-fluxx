class RuleEffect < ActiveRecord::Base
  belongs_to :card
  belongs_to :effect_type
  attr_accessible :change_type, :condition_code, :parameter_json
end
