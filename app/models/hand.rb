class Hand < ActiveRecord::Base
  validates :no_of_cards, :inclusion => 1..7
  validates :suit_id , :presence => true
  validates :status_id, :presence => true
  belongs_to :suit
  belongs_to :game
  belongs_to :status
  has_many :hand_players

  after_initialize :init


  def init
    self.status_id ||= 1
  end
end
