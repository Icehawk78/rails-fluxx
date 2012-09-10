class RenameGameCardInTables < ActiveRecord::Migration
  def change
    rename_column :game_rules, :game_card_id, :deck_card_id
    rename_column :action_stacks, :game_card_id, :deck_card_id
  end
end
