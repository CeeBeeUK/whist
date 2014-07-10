class GamesController < ApplicationController
  before_action :get_game, only: [:show]
  before_action :get_players, only: [:new]


  def new

    @game = Game.new
    # 2.times {@game.players.build}
  end

  def create
    # @game = Game.new(game_params)
    @game = Game.new
    @game.status_id = params['status_id']
    @game.trump_type_id = params['trump_type_id']
    puts '---------'
    puts "game_parms=#{game_params}"
    puts "validity=#{@game.valid?}"
    puts "players data = #{game_params['players_attributes']}"
    puts "player count = #{game_params['players_attributes'].size}"
    puts '---------'
    if @game.save
      redirect_to @game, notice: 'Game has started.'
    else
      render :new
    end
  end

  def show
  end


  private
  def game_params
    # if params[:game].present?
      params.fetch(:game, {}).permit(:trump_type_id, :status_id, players_attributes: [:id, :name, :_destroy])
    # end
  end
  def get_game
    @game = Game.find(params[:id])
  end
  def get_players
    @players = Player.all
  end
end

