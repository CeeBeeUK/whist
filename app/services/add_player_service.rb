class AddPlayerService
  def add_player(game, player_name)
    # puts "Number of players in DB = #{Player.count}"
    @player = Player.find_by(name: player_name)
    # puts "Player found id = #{@player}"
    if @player.nil?
      @player = Player.create(name: player_name)
    end
    # puts "Player #{@player.name}, id=#{@player.id}, gameid=#{games.id}"
    game.players << @player
    # GamePlayer.create(player_id: @player.id, game_id: game.id)
  end
end