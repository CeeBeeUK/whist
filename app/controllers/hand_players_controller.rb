class HandPlayersController < ApplicationController
  before_action :configure, only: [:new, :create]

  def new
    @hp = HandPlayer.new
  end

  def create

    @service = GameService.new
    begin
      puts '+++++++++++++++++++++++++'
      puts params["hand_player"]['player_id']
      puts '+++++++++++++++++++++++++'
      puts "#{params}"
      puts '+++++++++++++++++++++++++'

      if params["hand_player"]['player_id'].blank?
        raise 'Please select 2-7 players'
      end


      params["hand_player"]['player_id'].each do |p|
        puts "tried to load a game with #{hp_params['game_id']} and add played id #{p}"
        @service.add_player(Game.find(hp_params['game_id']),p)
      end
      puts '+++++++++++++++++++++++++'
      redirect_to action:'show', controller:'games', id: hp_params['game_id']
    rescue => e
      @hp = HandPlayer.new(hp_params)
      @hp.errors[:base] << e.message
      @game = Game.find(hp_params['game_id'])
      render :new
    end
  end

  private
  def configure
    @game = Game.find(params[:id])
    @players = Player.all
  end

  def hp_params
    # if params[:game].present?
    params.require(:hand_player).permit(:game_id, :player_id)
    # end
  end
end
