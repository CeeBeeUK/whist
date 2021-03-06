class Game < ActiveRecord::Base
  validates :trump_type_id, presence: true
  validates :status_id, presence: true
  # validate :has_players

  belongs_to :trump_type
  has_many :hands
  has_many :hand_players, :through => :hands
  has_many :players, :through => :hand_players
  belongs_to :status

  after_initialize :init

  def init
    self.status_id  ||= 1           #will set the default value only if it's nil
    self.next_round ||= 1
  end
  def player_list
    result = []
    self.hands[self.players.distinct.size-1].hand_players.each { |x| result << x.player }
    result
  end
  def self.by_status(status)
    by_status_internal(status)
  end
  def self.setup
    where('status_id=?',1)
  end
  def self.in_progress
    where('status_id = ?', 2)
  end
  def self.complete
    where('status_id=?',3)
  end
  private
  def self.by_status_internal(status)
    joins(:status).where(statuses: {name: status})
  end
end
