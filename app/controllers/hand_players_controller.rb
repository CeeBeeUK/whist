class HandPlayersController < ApplicationController
  before_action :authenticate_user!
  before_action :configure, only: [:new, :create]

  def new
    @hp = HandPlayer.new
  end

  def create
    raise 'Please select 2-7 players' if params["hand_player"]['player_id'].blank?
    @service = GameService.new
    @game = get_game_by_id(hp_params['game_id'])
    begin
      params["hand_player"]['player_id'].each do |p|
        @service.add_player(@game,p)
      end
      redirect_to game_path(@game)
    rescue => e
      @hp = HandPlayer.new(hp_params)
      @hp.errors[:base] << e.message
      render :new
    end
  end

  private
  def configure
    @game = Game.find(params[:id])
    @players = Player.all
  end
  def get_game_by_id(id)
    Game.find(id)
  end
  def hp_params
    # if params[:game].present?
    params.require(:hand_player).permit(:game_id, :player_id)
    # end
  end
end
