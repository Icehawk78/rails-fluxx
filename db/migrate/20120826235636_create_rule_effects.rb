class CreateRuleEffects < ActiveRecord::Migration
  def change
    create_table :rule_effects do |t|
      t.references :card
      t.references :effect_type
      t.text :parameter_json
      t.text :change
      t.text :condition_code

      t.timestamps
    end
    add_index :rule_effects, :card_id
    add_index :rule_effects, :effect_type_id
  end
end
