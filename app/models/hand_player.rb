class HandPlayer < ActiveRecord::Base
  validates :player_id , :presence => true


  belongs_to :hand
  belongs_to :player

  acts_as_list scope: :hand
end
