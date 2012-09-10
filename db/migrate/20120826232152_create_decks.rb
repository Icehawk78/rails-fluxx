class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.references :game
      t.references :player
      t.references :deck_type

      t.timestamps
    end
    add_index :decks, :game_id
    add_index :decks, :player_id
    add_index :decks, :deck_type_id
  end
end
