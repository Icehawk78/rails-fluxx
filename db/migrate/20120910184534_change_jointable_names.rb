class ChangeJointableNames < ActiveRecord::Migration
  def change
    rename_table :card_properties, :cards_properties
  end
end
