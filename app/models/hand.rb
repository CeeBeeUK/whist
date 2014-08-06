class Hand < ActiveRecord::Base
  validates :no_of_cards, :inclusion => 1..7
  validates :suit_id , :presence => true

  belongs_to :suit
  belongs_to :game
  has_many :hand_players
end
