class CreateGoalEntities < ActiveRecord::Migration
  def change
    create_table :goal_entities do |t|
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end
