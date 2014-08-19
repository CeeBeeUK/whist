class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_game, only: [:show]
  before_action :get_players, only: [:new, :newplus]

  def new
    @game = Game.new
  end
  
  def newplus
    puts '++++++++++++++++++++++++++++++++++++++++++++='
    @game = Game.new
  end

  def createplus
    puts '--------------+++++++++++++-------------------'
    #puts "params[:game]=#{params[:game]}"
    #puts "params[:hand_player]=#{params[:hand_player]}"
  end

  def create
    @service = GameService.new
    @game = @service.start_game(game_params['trump_type_id'])
    if @game.save
      redirect_to({controller: 'hand_players', action: 'new', id: @game.id})
    else
      render :new
    end
  end

  def show
  end

  private
  def old_params
    # if params[:game].present?
      params.fetch(:game, {}).permit(:trump_type_id, :status_id) #, players_attributes: [:id, :name, :_destroy])
    # end
  end
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

