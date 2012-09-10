class ChangeGameRule < ActiveRecord::Migration
  def change
    add_column :game_rules, :default_parameter_json, :text
    rename_column :game_rules, :change, :change_type
    rename_column :rule_effects, :change, :change_type
  end
end
