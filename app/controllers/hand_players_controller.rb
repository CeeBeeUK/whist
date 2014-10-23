class HandPlayersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_data, only: [:bid, :start]
 
  def bid
  end

private

	def get_data
		@hand_player = HandPlayer.find(params[:hand_player_id])
		@hand = @hand_player.hand
	end
end