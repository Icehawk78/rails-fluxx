class CreateKeeperEffects < ActiveRecord::Migration
  def change
    create_table :keeper_effects do |t|
      t.references :card
      t.references :effect_type
      t.text :parameter_json

      t.timestamps
    end
    add_index :keeper_effects, :card_id
    add_index :keeper_effects, :effect_type_id
  end
end
