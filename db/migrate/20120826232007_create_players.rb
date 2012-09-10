class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.text :name
      t.text :description
      t.references :game

      t.timestamps
    end
    add_index :players, :game_id
  end
end
