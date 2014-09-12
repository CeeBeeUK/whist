class HandPlayersController < ApplicationController
  before_action :authenticate_user!
  before_action :configure, only: [:new, :create]

  def new
    @hp = HandPlayer.new
  end

  def create
    @service = GameService.new
    begin
      raise 'Please select 2-7 players' if params["hand_player"]['player_id'].blank?
      @game = Game.find(hp_params['game_id'])
      params["hand_player"]['player_id'].each do |p|
        @service.add_player(@game,p)
      end
      redirect_to game_path(@game)
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
