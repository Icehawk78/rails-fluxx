class CreateActionStacks < ActiveRecord::Migration
  def change
    create_table :action_stacks do |t|
      t.references :game_card
      t.references :effect_type
      t.text :parameter_json
      t.references :game
      t.references :player
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt

      t.timestamps
    end
    add_index :action_stacks, :game_card_id
    add_index :action_stacks, :effect_type_id
    add_index :action_stacks, :game_id
    add_index :action_stacks, :player_id
  end
end
