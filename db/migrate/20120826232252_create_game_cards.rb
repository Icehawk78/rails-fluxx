class CreateGameCards < ActiveRecord::Migration
  def change
    create_table :game_cards do |t|
      t.references :card
      t.references :deck

      t.timestamps
    end
    add_index :game_cards, :card_id
    add_index :game_cards, :deck_id
  end
end
