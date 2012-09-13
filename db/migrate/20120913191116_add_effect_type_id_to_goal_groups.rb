class AddEffectTypeIdToGoalGroups < ActiveRecord::Migration
  def change
    add_column :goal_groups, :effect_type_id, :integer
    add_index :goal_groups, :effect_type_id
  end
end
