class Property < ActiveRecord::Base
  has_and_belongs_to_many :cards
  attr_accessible :description, :name
end
