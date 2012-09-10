class Player < ActiveRecord::Base
  has_many :game_rules, :inverse_of => :player, :dependent => :destroy
  has_many :decks, :as => :owner, :dependent => :destroy
  has_many :action_stacks, :inverse_of => :player, :dependent => :destroy
  belongs_to :game, :inverse_of => :players
  attr_accessible :description, :name
end
