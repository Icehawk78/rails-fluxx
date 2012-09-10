class DeckCard < ActiveRecord::Base
  belongs_to :card
  has_one :card_type, :through => :card
  belongs_to :deck, :inverse_of => :deck_cards
  has_one :action_stack
  
  attr_accessible :card, :deck_order
  
  default_scope :order => 'deck_order ASC'
  
  def owner
    self.deck.owner
  end
  
  def move_to_deck new_deck
    unless new_deck == self.deck
      self.deck_order = new_deck.cards.size
      self.deck = new_deck
      self.save
    end
  end
  
  def find_related_deck deck_name
    if self.deck.owner_type == Player.to_s
      case deck_name
      when 'hand'
        self.owner.decks.hand.first
      when 'keeper'
        self.owner.decks.keeper.first
      when 'draw'
        self.owner.game.decks.draw.first
      when 'discard'
        self.owner.game.decks.discard.first
      when 'rule'
        self.owner.game.decks.rule.first
      when 'goal'
        self.owner.game.decks.goal.first
      end
    else
      case deck_name
      when 'draw'
        self.owner.decks.draw.first
      when 'discard'
        self.owner.decks.discard.first
      when 'rule'
        self.owner.decks.rule.first
      when 'goal'
        self.owner.decks.goal.first
      end
    end
  end
  
  def play_card
    if self.deck.is_hand?
      new_deck = find_related_deck case self.card_type.name
      when 'action'
        'discard'
      when 'keeper'
      when 'rule'
        self.card_type.name
      when 'individual_goal'
      when 'collective_goal'
      when 'miscellaneous_goal'
        'goal'
      end
      self.move_to_deck new_deck
    end
  end
end
