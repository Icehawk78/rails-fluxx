class RenameGameCardToDeckCard < ActiveRecord::Migration
  def change
    rename_table :game_cards, :deck_cards
  end
end
