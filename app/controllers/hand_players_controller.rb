class HandPlayersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_bid_data, only: [:bid]
  before_action :get_create_data, only: [:createbid]
 
  def bid
  end
  def createbid
  	if params[:hand_player][:bid].nil?
		flash[:error] = "Please select a bid between 0 and #{@hand.no_of_cards}"
	  	render :bid
    elsif @hand_player.update(bid: params[:hand_player][:bid])
  		redirect_to game_path(@game.id)
	end
  end

  private
  	def get_create_data
  	  	@hand_player = HandPlayer.find(params[:hand_player][:id])
  	  	get_data_base	
  	end
  	def get_bid_data
		@hand_player = HandPlayer.find(params[:hand_player_id])
		get_data_base
  	end
	def get_data_base
		@hand = @hand_player.hand
		@game = @hand.game
	end
end