class Hand < ActiveRecord::Base
  validates :no_of_cards, :inclusion => 1..7
  validates :suit_id , :presence => true
  validates :status_id, :presence => true

  belongs_to :suit
  belongs_to :game
  belongs_to :status
  belongs_to :dealer, :class_name=>'Player', :foreign_key=>"dealer_id"

  has_many :hand_players

  after_initialize :init

  def init
    self.status_id ||= 1
  end

  def bid_total 
    hand_players.sum(:bid)
  end
  def bid_count
    hand_players.where('bid IS NOT null').size
  end
  def next_player
    next_hand_player.player
  end
  def next_hand_player
    hand_players.where('bid IS NULL').first
  end
end
