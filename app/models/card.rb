class Card < ActiveRecord::Base
  belongs_to :card_type
  has_and_belongs_to_many :properties
  attr_accessible :description, :name
end
