class GameService
  
    # &#x1F0A1; = Ace of spades
    # &spades;
    # http://en.wikipedia.org/wiki/Playing_Cards_(Unicode_block) 

  def start_game_plus(trump_type, player_ids)
    # puts '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
    # puts "trump_type=#{trump_type}"
    # puts "player_ids=#{player_ids}"
    # puts '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'

    @game = Game.new(trump_type_id: trump_type, status_id: 1)
    @trump_sequence = (2..5).to_a.sort{ rand() - 0.5 }[0..4]
    x = 0;
    @i = 1;
    @this_round_trump = @trump_sequence[x]
    @this_suit = Suit.find(@this_round_trump)
    [7,6,5,4,3,2,1, 2, 3, 4, 5,6,7].each do |card|
      @new_hand = Hand.new(no_of_cards: card, suit: @this_suit, sequence:@i )
      @game.hands << @new_hand
      if @game.trump_type_id==2
        @this_suit = Suit.find(1)
      else
        x = (x<=2 ? x+1 : 0)
        @this_suit = Suit.find(@trump_sequence[x])
      end
      @i+=1
    end
    (player_ids).each do |sequence,player|
      @player = Player.find_by(id: player)
      if @player.nil?
        @player = Player.find_by(name: player)
        if @player.nil?
          @player = Player.create(name: player)
        end
      end
      if @game.players.include? @player || @player.nil?
        raise 'Player already in game'
      end
      @game.save!
      @game.hands.each do |h|
        h.dealer=1 # TODO get next player
        h.hand_players << HandPlayer.new( player_id: @player.id, game_id: @game.id )
      end
    end
    @game
  end
end