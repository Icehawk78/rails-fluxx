class Card < ActiveRecord::Base
  belongs_to :card_type
  has_and_belongs_to_many :properties
  attr_accessible :description, :name
  
  def effects
    @effect_class = case self.card_type.name
      when 'keeper' then KeeperEffect
      when 'rule' then RuleEffect
      when 'action' then ActionEffect
      when 'individual_goal' then GoalGroup
    end
    @effects = @effect_class.where(:card_id => self.id) unless @effect_class.nil?
  end
end
