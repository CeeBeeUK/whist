class HandPlayersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_bid_data, only: [:bid]
  before_action :get_create_data, only: [:createbid]
 
  def bid
  end
  def createbid
  	begin
  		puts '=======================' 
  		puts params[:hand_player][:bid]
	  	raise "Please select a bid between 0 and #{@hand.no_of_cards}" if params[:hand_player][:bid].blank?

	    @gs = GameService.new
	    @gs.set_bid(@hand, @hand_player, params[:hand_player][:bid])
		redirect_to game_path(@game.id)
	rescue => e
		flash[:error] = e
	  	render :bid
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