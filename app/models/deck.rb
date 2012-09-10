class Deck < ActiveRecord::Base
  belongs_to :owner, :polymorphic => true
  belongs_to :deck_type
  has_many :deck_cards, :inverse_of => :deck, :dependent => :destroy
  has_many :cards, :through => :deck_cards
  attr_accessible :deck_type
  
  # Game-owned deck types
  scope :draw, joins(:deck_type).where({:deck_types => {:name => :draw}})
  scope :discard, joins(:deck_type).where({:deck_types => {:name => :discard}})
  scope :rule, joins(:deck_type).where({:deck_types => {:name => :rule}})
  scope :goal, joins(:deck_type).where({:deck_types => {:name => :goal}})
  scope :play_queue, joins(:deck_type).where({:deck_types => {:name => :play_queue}})
    
  # Player-owned deck types
  scope :hand, joins(:deck_type).where({:deck_types => {:name => :hand}})
  scope :keeper, joins(:deck_type).where({:deck_types => {:name => :keeper}})
  scope :dreams_and_omens, joins(:deck_type).where({:deck_types => {:name => :dreams_and_omens}})

  def is_hand?
    owner_type == 'Player' and deck_type.name == 'hand'
  end
  
  def is_keeper?
    owner_type == 'Player' and deck_type.name == 'keeper'
  end
  
  def is_dreams_and_omens?
    owner_type == 'Player' and deck_type.name == 'dreams_and_omens'
  end
  
  def is_draw?
    owner_type == 'Game' and deck_type.name == 'draw'
  end
    
  def is_discard?
    owner_type == 'Game' and deck_type.name == 'discard'
  end
    
  def is_rule?
    owner_type == 'Game' and deck_type.name == 'rule'
  end
    
  def is_goal?
    owner_type == 'Game' and deck_type.name == 'goal'
  end
    
  def is_play_queue?
    owner_type == 'Game' and deck_type.name == 'play_queue'
  end
end