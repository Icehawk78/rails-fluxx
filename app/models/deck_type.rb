class DeckType < ActiveRecord::Base
  attr_accessible :description, :name, :owner_type
end
