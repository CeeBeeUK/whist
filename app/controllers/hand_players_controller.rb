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
        puts '------------'
        puts 'okay'
        puts '------------'
        redirect_to action:'new', id: hp_params['game_id']
      else
        puts '------------'
        puts 'validation error'
        puts '------------'
        redirect_to action:'new', id: hp_params['game_id']
      end
    rescue => e
      puts '------------'
      puts 'rescued'
      puts '------------'
      puts "Detailed error: #{e.message}"
      puts '----------------'
      @hp = HandPlayer.new(hp_params)
      # @hp.errors.add(:player_id, e.message)
      @hp.errors[:base] << e.message
      # @user.errors.add(:email, "Not valid")
      # @user.errors[:base] << "This person is invalid because ..."
      @game = Game.find(hp_params['game_id'])
      render :new
      #  render action: 'new', id: hp_params['game_id']
      # redirect_to({controller: 'hand_players', action: 'new', id: hp_params['game_id']})
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
