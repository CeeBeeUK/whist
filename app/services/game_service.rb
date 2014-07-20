class GameService
  def start_game(trump_type)
    @game = Game.new(trump_type_id: trump_type, status_id: 1)
    @trump_sequence = (2..5).to_a.sort{ rand() - 0.5 }[0..4]
    x = 0;
    @this_round_trump = @trump_sequence[x]
    @this_suit = Suit.find(@this_round_trump)
    [7,6,5,4,3,2,1, 2, 3, 4, 5,6,7].each do |card|
      @new_hand = Hand.new(no_of_cards: card, suit: @this_suit )
      @game.hands << @new_hand
      if trump_type==2
        @this_suit = Suit.find(1)
      else
        x = (x<=2 ? x+1 : 0)
        @this_suit = Suit.find(@trump_sequence[x])
      end
    end
    @game
  end
  def add_player(game, player)
    if game.player_list.size==7
      raise 'Too many players'
    end
    # puts "Number of players in DB = #{Player.count}"
    @player = Player.find_by(id: player)
    # puts "Player found id = #{@player}"
    if @player.nil?
      @player = Player.find_by(name: player)
      if @player.nil?
        @player = Player.create(name: player)
      end
    end
    if game.players.include? @player || @player.nil?
      raise 'Player already in game'
    end
    game.hands.each do |h|
      h.hand_players << HandPlayer.new( player_id: @player.id )
    end
    # puts "Game.hands.size = #{game.hands.size}"
    # puts "game.hand_players.size = #{game.hand_players.size}"
    # puts "Game.players.size = #{game.players.size}"
  end
end