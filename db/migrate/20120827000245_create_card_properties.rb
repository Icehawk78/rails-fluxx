class CreateCardProperties < ActiveRecord::Migration
  def change
    create_table :card_properties do |t|
      t.references :card
      t.references :property

      t.timestamps
    end
    add_index :card_properties, :card_id
    add_index :card_properties, :property_id
  end
end
