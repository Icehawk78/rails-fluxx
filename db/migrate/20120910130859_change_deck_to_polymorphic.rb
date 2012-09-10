class ChangeDeckToPolymorphic < ActiveRecord::Migration
  def change
    remove_column :decks, :player_id
    remove_column :decks, :game_id
    add_column :decks, :owner_id, :integer
    add_column :decks, :owner_type, :string
  end
end
