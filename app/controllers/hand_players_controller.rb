class HandPlayersController < ApplicationController
  before_action :configure, only: [:new, :create]

  def new
    @hp = HandPlayer.new
  end

  def create

    @service = GameService.new
    begin
      if hp_params['player_id'].blank?
        raise 'please select player'
      end

      if @service.add_player(Game.find(hp_params['game_id']),hp_params['player_id'])
        redirect_to action:'new', id: hp_params['game_id']
      else
        redirect_to action:'new', id: hp_params['game_id']
      end
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
