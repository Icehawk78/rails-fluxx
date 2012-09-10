class ChangeEntityIdColumnNameOnGoalConditions < ActiveRecord::Migration
  def change
    remove_index :goal_conditions, :entity_id_id
    rename_column :goal_conditions, :entity_id_id, :entity_id
    add_index :goal_conditions, :entity_id
  end
end
