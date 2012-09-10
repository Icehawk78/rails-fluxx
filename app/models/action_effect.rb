class ActionEffect < ActiveRecord::Base
  belongs_to :card
  belongs_to :effect_type
  attr_accessible :order, :parameter_json
end
