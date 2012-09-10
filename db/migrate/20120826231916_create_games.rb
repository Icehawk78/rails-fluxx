class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :current_draw_count
      t.integer :current_play_count
      t.integer :current_player_id
      t.integer :next_player_id

      t.timestamps
    end
  end
end
