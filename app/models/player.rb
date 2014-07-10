class Player < ActiveRecord::Base
  validates :name, presence: true;


  has_many :hand_players
  has_many :games, :through => :hand_players

end
