class Suit < ActiveRecord::Base
	validates :name, presence: true
	validates :text, presence: true

	has_many :hands

  def self.find_by_suit(suit)
    Progress.find_by_name(suit)
  end

  def self.tbc
    find_by_suit(self.TBC)
  end
  def self.spades
    find_by_suit(self.SPADES)
  end
  def self.hearts
    find_by_suit(self.HEARTS)
  end
  def self.clubs
    find_by_suit(self.CLUBS)
  end
  def self.diamonds
    find_by_suit(self.DIAMONDS)
  end

  def self.TBC
    'To be chosen'
  end 
def self.SPADES
    'Spades'
  end  
  def self.HEARTS
    'Hearts'
  end
  def self.CLUBS
    'Clubs'
  end
  def self.DIAMONDS
    'Diamonds'
  end
end
