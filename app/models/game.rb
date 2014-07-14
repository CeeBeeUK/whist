class Game < ActiveRecord::Base
  validates :trump_type_id, presence: true
  validates :status_id, presence: true
  # validate :has_players

  belongs_to :trump_type
  has_many :hands
  has_many :hand_players, :through => :hands
   has_many :players, :through => :hand_players
  belongs_to :status

  # accepts_nested_attributes_for :players, :reject_if => :all_blank, :allow_destroy => true

  after_initialize :init


  def init
    self.status_id  ||= 1           #will set the default value only if it's nil
  end
  def player_list
    players.select('DISTINCT(players.id)')
  #   @user.select("DISTINCT(badges.id), badges.*").badges.order("badges.id").order("badges.created_at DESC")
  end

  # def has_players
  #   errors.add(:base, 'must have between 2 and 7 players') if !(2..7).include?(self.players.size)
  # end

  def self.in_progress
    where('status_id = ?', 1)
  end
  def self.complete
    where('status_id=?',2)
  end
  # def can_start()
  #   result = false
  #   if (2..7).include?(players.size)
  #     result = true
  #   end
  #   result
  # end
end
