class CreateEffectTypes < ActiveRecord::Migration
  def change
    create_table :effect_types do |t|
      t.text :method
      t.text :description

      t.timestamps
    end
  end
end
