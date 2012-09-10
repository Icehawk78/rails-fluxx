class CreateActionEffects < ActiveRecord::Migration
  def change
    create_table :action_effects do |t|
      t.references :card
      t.references :effect_type
      t.text :parameter_json
      t.integer :order
      t.integer :parent_id

      t.timestamps
    end
    add_index :action_effects, :card_id
    add_index :action_effects, :effect_type_id
  end
end
