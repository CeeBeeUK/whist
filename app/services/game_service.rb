class GameService
  
    # &#x1F0A1; = Ace of spades
    # &spades;
    # http://en.wikipedia.org/wiki/Playing_Cards_(Unicode_block) 

  def start_game(trump_type, player_ids)
    @game = Game.new(trump_type_id: trump_type, status_id: 1)
    @trump_sequence = (2..5).to_a.sort{ rand() - 0.5 }[0..4]
    x = 0;
    @i = 1;
    c = player_ids.size
    @this_round_trump = @trump_sequence[x]
    @this_suit = Suit.find(@this_round_trump)
    [7,6,5,4,3,2,1, 2, 3, 4, 5,6,7].each do |card|
    	# puts '---------'
    	# puts "hand #{@i}"
      	@new_hand = Hand.new(no_of_cards: card, suit: @this_suit, sequence:@i)

      	dealer = @new_hand.sequence.modulo(c)
      	dealer = c if dealer == 0 
			
    # puts "dealer=#{dealer}"
    seq=0
    (player_ids.drop(dealer)+player_ids.take(dealer)).each do |val,player|
      #todo make sequence an increment
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
			# puts "Adding Player #{@player.name} to hand #{@new_hand.sequence}"
			@new_hand.hand_players << HandPlayer.new( player_id: @player.id, game_id: @game.id, sequence: seq )
      seq+=1
  	end
  	# Get the dealer item from the player_id hash
  	# and in the 0th array, get the 2nd entry (0,1)
  	@new_hand.dealer_id = player_ids.drop(dealer-1).take(1)[0][1]
  	# puts "@new_hand.dealer_id=#{@new_hand.dealer_id}"

  	#set up for next loop through
		@game.hands << @new_hand
		if @game.trump_type_id==2
			@this_suit = Suit.find(1)
		else
			x = (x<=2 ? x+1 : 0)
			@this_suit = Suit.find(@trump_sequence[x])
		end
		@i+=1
    end
    @game.status = Status.in_progress
    @game.save
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
end