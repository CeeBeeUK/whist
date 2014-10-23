class HandPlayer < ActiveRecord::Base
	validates :player_id , :presence => true
	validates :bid, numericality: { only_integer: true }, :allow_nil => true
	
	belongs_to :hand
  	belongs_to :player
	
end
