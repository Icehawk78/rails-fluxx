class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :name
      t.text :description
      t.references :card_type

      t.timestamps
    end
    add_index :cards, :card_type_id
  end
end
