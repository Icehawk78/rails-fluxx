class KeeperEffect < ActiveRecord::Base
  belongs_to :card
  belongs_to :effect_type
  attr_accessible :parameter_json
end
