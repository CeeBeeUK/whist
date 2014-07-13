class GameService
  def start_game(trump_type)
    @game = Game.new(trump_type_id: trump_type, status_id: 1)
    @trumpid = rand(2..5)
    [7,6,5,4,3,2,1, 2, 3, 4, 5,6,7].each do |card|
      @game.hands << Hand.create(no_of_cards: card, suit_id:  @trumpid)
      if trump_type==1
        @trumpid = 1
      else

        @trumpid = rand(2..5)
      end
    end
    @game
  end
  def add_player(game, player_name)
    # puts "Number of players in DB = #{Player.count}"
    @player = Player.find_by(name: player_name)
    # puts "Player found id = #{@player}"
    if @player.nil?
      @player = Player.create(name: player_name)
    end
    game.hands.each do |h|
      h.hand_players << HandPlayer.new( player_id: @player.id )
    end
    # puts "Game.hands.size = #{game.hands.size}"
    # puts "game.hand_players.size = #{game.hand_players.size}"
    # puts "Game.players.size = #{game.players.size}"
  end
end