class TrumpType < ActiveRecord::Base
  has_many :games

  def self.winner
    find_by_trump_type(self.WINNER)
  end

  def self.random
    find_by_trump_type(self.RANDOM)
  end

  def self.find_by_trump_type(type)
    TrumpType.find_by_name(type)
  end

  def self.WINNER
    'WinnerPicks'
  end
  
  def self.RANDOM
    'Random'
  end
end
