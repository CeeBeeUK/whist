class GameService
  
    # &#x1F0A1; = Ace of spades
    # &spades;
    # http://en.wikipedia.org/wiki/Playing_Cards_(Unicode_block) 

  def start_game(trump_type, player_ids)
    raise 'Player already in game' if are_players_unique(player_ids)
    @game = Game.new(trump_type_id: trump_type, status_id: 1)
    @trump_sequence = get_random_trump_sequence
    @round = 0;
    @hand_seq = 1;
    @initial = true
    
    card_sequence.each do |card|
      @dealer = get_dealer(player_ids)
      @new_hand = Hand.new(
          no_of_cards: card, 
          suit: get_trump(trump_type), 
          sequence:@hand_seq,
          dealer_id: get_dealer_from_players(player_ids))
      seq=0
      get_player_sequence(player_ids).each do |ignore,player|
      	p_id = find_player(player).id
      	@new_hand.hand_players << HandPlayer.new( player_id: p_id, game_id: @game.id, sequence: seq )
        seq+=1
      end
  		@game.hands << @new_hand
      #set up for next loop through
  		@hand_seq+=1
    end
    @game.update(status: Status.in_progress)
    @game
  end

  def set_bid(hand, hand_player, bid)
    if (hand.hand_players.size-1) == hand_player.sequence
      if bid + hand.bid_total== hand.no_of_cards
        raise 'Dealer bid cannot equal number of cards in hand'
      end 
    end
    hand.update(status_id: Status.in_progress.id)
    hand_player.update(bid: bid)
  end

private
  def are_players_unique(player_ids)
    player_ids.map(&:last).uniq.size != player_ids.size
  end
  def find_player(player)
    @player = Player.find_by(id: player)
    if @player.nil?
      @player = Player.find_by(name: player)
      if @player.nil?
        @player = Player.create(name: player)
      end
    end
    @player
  end
  def card_sequence
    [7,6,5,4,3,2,1,2,3,4,5,6,7]
  end
  def get_random_trump_sequence
    (2..5).to_a.sort{ rand() - 0.5 }[0..4]
  end
  def get_dealer(players)
    dealer = @hand_seq.modulo(players.size)
    dealer = players.size if dealer == 0 
    dealer
  end
  def get_trump(trump_type)
    if @game.trump_type_id==2 && !@initial
      Suit.find(1)
    else
      @round = @initial ? @round : (@round<=2 ? @round+1 : 0)
      @initial=false
      Suit.find(@trump_sequence[@round])
    end
  end
  def get_player_sequence(player_ids)
    (player_ids.drop(@dealer)+player_ids.take(@dealer))
  end
  def get_dealer_from_players(player_ids)
    player_ids.drop(@dealer-1).take(1)[0][1]
  end
end