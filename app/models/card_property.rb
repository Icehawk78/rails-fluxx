class CardProperty < ActiveRecord::Base
  belongs_to :card
  belongs_to :property
  # attr_accessible :title, :body
end
