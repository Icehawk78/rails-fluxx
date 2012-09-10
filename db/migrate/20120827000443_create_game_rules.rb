class CreateGameRules < ActiveRecord::Migration
  def change
    create_table :game_rules do |t|
      t.references :game
      t.references :player
      t.references :game_card
      t.references :effect_type
      t.text :parameter_json
      t.text :change
      t.text :condition_code

      t.timestamps
    end
    add_index :game_rules, :game_id
    add_index :game_rules, :player_id
    add_index :game_rules, :game_card_id
    add_index :game_rules, :effect_type_id
  end
end
