class GameCard < ActiveRecord::Base
  belongs_to :card
  belongs_to :deck
  has_one :action_stack
  # attr_accessible :title, :body
end
