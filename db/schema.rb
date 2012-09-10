# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120910184534) do

  create_table "action_effects", :force => true do |t|
    t.integer  "card_id"
    t.integer  "effect_type_id"
    t.text     "parameter_json"
    t.integer  "order"
    t.integer  "parent_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "action_effects", ["card_id"], :name => "index_action_effects_on_card_id"
  add_index "action_effects", ["effect_type_id"], :name => "index_action_effects_on_effect_type_id"

  create_table "action_stacks", :force => true do |t|
    t.integer  "deck_card_id"
    t.integer  "effect_type_id"
    t.text     "parameter_json"
    t.integer  "game_id"
    t.integer  "player_id"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "action_stacks", ["deck_card_id"], :name => "index_action_stacks_on_game_card_id"
  add_index "action_stacks", ["effect_type_id"], :name => "index_action_stacks_on_effect_type_id"
  add_index "action_stacks", ["game_id"], :name => "index_action_stacks_on_game_id"
  add_index "action_stacks", ["player_id"], :name => "index_action_stacks_on_player_id"

  create_table "card_types", :force => true do |t|
    t.text     "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "cards", :force => true do |t|
    t.text     "name"
    t.text     "description"
    t.integer  "card_type_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "cards", ["card_type_id"], :name => "index_cards_on_card_type_id"

  create_table "cards_properties", :force => true do |t|
    t.integer  "card_id"
    t.integer  "property_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "cards_properties", ["card_id"], :name => "index_card_properties_on_card_id"
  add_index "cards_properties", ["property_id"], :name => "index_card_properties_on_property_id"

  create_table "deck_cards", :force => true do |t|
    t.integer  "card_id"
    t.integer  "deck_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "deck_order"
  end

  add_index "deck_cards", ["card_id"], :name => "index_game_cards_on_card_id"
  add_index "deck_cards", ["deck_id"], :name => "index_game_cards_on_deck_id"

  create_table "deck_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "owner_type"
  end

  create_table "decks", :force => true do |t|
    t.integer  "deck_type_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "owner_id"
    t.string   "owner_type"
  end

  add_index "decks", ["deck_type_id"], :name => "index_decks_on_deck_type_id"

  create_table "effect_types", :force => true do |t|
    t.text     "method"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "game_rules", :force => true do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.integer  "deck_card_id"
    t.integer  "effect_type_id"
    t.text     "parameter_json"
    t.text     "change_type"
    t.text     "condition_code"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.text     "default_parameter_json"
  end

  add_index "game_rules", ["deck_card_id"], :name => "index_game_rules_on_game_card_id"
  add_index "game_rules", ["effect_type_id"], :name => "index_game_rules_on_effect_type_id"
  add_index "game_rules", ["game_id"], :name => "index_game_rules_on_game_id"
  add_index "game_rules", ["player_id"], :name => "index_game_rules_on_player_id"

  create_table "games", :force => true do |t|
    t.integer  "current_draw_count"
    t.integer  "current_play_count"
    t.integer  "current_player_id"
    t.integer  "next_player_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "goal_conditions", :force => true do |t|
    t.integer  "goal_group_id"
    t.integer  "goal_entity_id"
    t.integer  "entity_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "goal_conditions", ["entity_id"], :name => "index_goal_conditions_on_entity_id"
  add_index "goal_conditions", ["goal_entity_id"], :name => "index_goal_conditions_on_goal_entity_id"
  add_index "goal_conditions", ["goal_group_id"], :name => "index_goal_conditions_on_goal_group_id"

  create_table "goal_entities", :force => true do |t|
    t.text     "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "goal_groups", :force => true do |t|
    t.integer  "card_id"
    t.integer  "required_count"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "goal_groups", ["card_id"], :name => "index_goal_groups_on_card_id"

  create_table "keeper_effects", :force => true do |t|
    t.integer  "card_id"
    t.integer  "effect_type_id"
    t.text     "parameter_json"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "keeper_effects", ["card_id"], :name => "index_keeper_effects_on_card_id"
  add_index "keeper_effects", ["effect_type_id"], :name => "index_keeper_effects_on_effect_type_id"

  create_table "players", :force => true do |t|
    t.text     "name"
    t.text     "description"
    t.integer  "game_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "players", ["game_id"], :name => "index_players_on_game_id"

  create_table "properties", :force => true do |t|
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "name"
  end

  create_table "rule_effects", :force => true do |t|
    t.integer  "card_id"
    t.integer  "effect_type_id"
    t.text     "parameter_json"
    t.text     "change_type"
    t.text     "condition_code"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "rule_effects", ["card_id"], :name => "index_rule_effects_on_card_id"
  add_index "rule_effects", ["effect_type_id"], :name => "index_rule_effects_on_effect_type_id"

  create_table "valid_actions", :force => true do |t|
    t.integer  "game_id"
    t.integer  "action_stack_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "valid_actions", ["action_stack_id"], :name => "index_valid_actions_on_action_stack_id"
  add_index "valid_actions", ["game_id"], :name => "index_valid_actions_on_game_id"

end
