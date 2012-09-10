class CreateGoalConditions < ActiveRecord::Migration
  def change
    create_table :goal_conditions do |t|
      t.references :goal_group
      t.references :goal_entity
      t.references :entity_id

      t.timestamps
    end
    add_index :goal_conditions, :goal_group_id
    add_index :goal_conditions, :goal_entity_id
    add_index :goal_conditions, :entity_id_id
  end
end
