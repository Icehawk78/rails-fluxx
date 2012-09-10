class ValidAction < ActiveRecord::Base
  belongs_to :game
  belongs_to :action_stack
  # attr_accessible :title, :body
end
