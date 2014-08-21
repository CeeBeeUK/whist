class HandPlayer < ActiveRecord::Base
  validates :player_id , :presence => true

  belongs_to :hand
  belongs_to :player

end
