class CreateValidActions < ActiveRecord::Migration
  def change
    create_table :valid_actions do |t|
      t.references :game
      t.references :action_stack

      t.timestamps
    end
    add_index :valid_actions, :game_id
    add_index :valid_actions, :action_stack_id
  end
end
