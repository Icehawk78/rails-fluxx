class CreateCardTypes < ActiveRecord::Migration
  def change
    create_table :card_types do |t|
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end
