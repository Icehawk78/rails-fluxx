class AddDeckOrderToDeckCards < ActiveRecord::Migration
  def change
    add_column :deck_cards, :deck_order, :integer
  end
end
