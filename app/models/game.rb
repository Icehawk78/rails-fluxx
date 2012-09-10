class Game < ActiveRecord::Base
  has_many :players, :inverse_of => :game, :dependent => :destroy
  has_many :decks, :as => :owner, :dependent => :destroy
  has_many :action_stacks, :inverse_of => :game, :dependent => :destroy
  has_many :game_rules, :inverse_of => :game, :dependent => :destroy
  has_many :valid_actions, :inverse_of => :game, :dependent => :destroy
  belongs_to :current_player, :class_name => "Player"
  belongs_to :next_player, :class_name => "Player"
  attr_accessible :current_draw_count, :current_play_count
  
  
  
  def initial_setup args
    if args.is_a? Hash
      
      # Set current draw/play counts to their default values (0 in most cases)
      self.current_draw_count ||= (args[:current_draw_count] or 0)
      self.current_play_count ||= (args[:current_play_count] or 0)
        
      # Create new players from a string list unless they already exist
      if self.players.empty? and not args[:players].to_a.empty?
        args[:players].to_a.each do |player|
          self.players.create(:name => player, :description => "Player #{self.players.size + 1}")
        end
      end
      
      # Set the current/next players to the first/second players in the list; set both to first player if there's only one
      unless self.players.empty?
        self.current_player = self.players[0]
        self.next_player = (self.players[1] or self.current_player)
      end
      
      # Save the existing changes to the Game object - all further changes are just on child models
      self.save
      
      # Create all empty decks for both the game and each player
      if self.decks.empty?
        DeckType.find_all_by_owner_type(Game).each do |type|
          self.decks.create(:deck_type => type)
        end
        self.players.each do |player|
          DeckType.find_all_by_owner_type(Player).each do |type|
            player.decks.create(:deck_type => type)
          end
        end
      end
      
      # Create deck_cards for the draw pile from either a supplied :card_list or all cards
      if self.decks.draw.first.cards.empty?
        draw = self.decks.draw.first
        card_list = (args[:card_list] or Card.all)
        card_list.shuffle.each do |card|
          draw.deck_cards.create(:card => card, :deck_order => draw.deck_cards.size)
        end
      end
      
      # Create default rule set
      if self.game_rules.empty?
        default_rules = (args[:default_rules] or default_rule_set)
        default_rules.each do |rule|
          self.game_rules.create(rule)
        end
      end
      
      # For hot chaining goodness
      self
    else
      raise ArgumentError
    end
  end
  
  def deal_cards card_count
    draw = self.decks.draw.first
    player_hands = self.players.map do |player|
      player.decks.hand.first
    end
    card_count.times do 
      player_hands.each do |hand|
        draw.deck_cards.shift.move_to_deck hand
      end
    end
  end
  
  def default_rule_set
    # DrawLimit, PlayLimit, HandLimit, KeeperLimit, RuleLimit, GoalLimit
    [
      {
        :effect_type => EffectType.find_by_method(:drawLimit),
        :change_type => 'E',
        :parameter_json => '1',
        :default_parameter_json => '1'
      },
      {
        :effect_type => EffectType.find_by_method(:playLimit),
        :change_type => 'E',
        :parameter_json => '1',
        :default_parameter_json => '1'
      },
      {
        :effect_type => EffectType.find_by_method(:handLimit),
        :change_type => 'E',
        :parameter_json => '-1',
        :default_parameter_json => '-1'
      },
      {
        :effect_type => EffectType.find_by_method(:keeperLimit),
        :change_type => 'E',
        :parameter_json => '-1',
        :default_parameter_json => '-1'
      },
      {
        :effect_type => EffectType.find_by_method(:ruleLimit),
        :change_type => 'E',
        :parameter_json => '-1',
        :default_parameter_json => '-1'
      },
      {
        :effect_type => EffectType.find_by_method(:goalLimit),
        :change_type => 'E',
        :parameter_json => '1',
        :default_parameter_json => '1'
      }
    ]
  end
end
