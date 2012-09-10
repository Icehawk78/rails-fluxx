class AddOwnerTypeToDeckType < ActiveRecord::Migration
  def change
    add_column :deck_types, :owner_type, :text
  end
end
