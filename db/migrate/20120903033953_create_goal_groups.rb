class CreateGoalGroups < ActiveRecord::Migration
  def change
    create_table :goal_groups do |t|
      t.references :card
      t.integer :required_count

      t.timestamps
    end
    add_index :goal_groups, :card_id
  end
end
