class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_game, only: [:show]
  before_action :get_players, only: [:new, :newplus, :createplus]

  def new
    @game = Game.new
  end

  def create
    @service = GameService.new
    begin
      if params['hand_player']['player_id'].blank?
        raise 'Please select 2-7 players'
      end
      @game = @service.start_game(params['game']['trump_type_id'], params['hand_player']['player_id'])
      if @game.save
        redirect_to game_path(@game)
      else 
        render :new
      end 
    rescue => e
      # @game.errors[:base] << e.message
      render :new
    end
  end


  def show
  end

  def by_status
    status = params['qstatus']
    @games = Game.by_status(params[:qstatus].humanize)
  end


  private
  def game_params
    params.fetch(:game,{}).permit(:trump_type_id, :status_id, hand_player: [:game_id, :player_id])
  end
  def get_game
    @game = Game.find(params[:id])
  end
  def get_players
    @players = Player.all
  end
end

