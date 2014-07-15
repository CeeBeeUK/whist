class HandPlayersController < ApplicationController
  before_action :configure, only: [:new]

  def new
    @hp = HandPlayer.new
  end

  def create

    @service = GameService.new

    if @service.add_player(Game.find(hp_params['game_id']),hp_params['player_id'])
      # redirect_to hand_players_new_path, id: @hp.game_id
      puts'------------yay'
      redirect_to action:'new', id: hp_params['game_id']
    else
      puts '************boo'
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
