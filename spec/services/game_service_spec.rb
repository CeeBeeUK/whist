require 'spec_helper'

describe GameService do
	values_seed

	it 'should create hands with sequential dealers' do
		player1 = Player.create(name: 'PlayerOne')
		player2 = Player.create(name: 'PlayerTwo')
		player3 = Player.create(name: 'PlayerThree')
		player4 = Player.create(name: 'PlayerFour')
	    @gs = GameService.new
	    game = @gs.start_game(1,{"0"=>player2.id, "1"=>player3.id, "2"=>player4.id, "3"=>player1.id})
	    expect(game).to be_valid
	    expect(game.hands.size).to eql(13)
	   	expect(game.hands[0].dealer_id).to eql(player2.id)
	    expect(game.hands[1].dealer_id).to eql(player3.id)
	    expect(game.hands[2].dealer_id).to eql(player4.id)
	    expect(game.hands[3].dealer_id).to eql(player1.id)
	    expect(game.hands[4].dealer_id).to eql(player2.id)
	    expect(game.hands[5].dealer_id).to eql(player3.id)
	    expect(game.hands[6].dealer_id).to eql(player4.id)
	    expect(game.hands[7].dealer_id).to eql(player1.id)
	    expect(game.hands[8].dealer_id).to eql(player2.id)
	    expect(game.hands[9].dealer_id).to eql(player3.id)
	    expect(game.hands[10].dealer_id).to eql(player4.id)
	    expect(game.hands[11].dealer_id).to eql(player1.id)
	    expect(game.hands[12].dealer_id).to eql(player2.id)
	    expect(game.player_list.size).to eql(4)
	end
	it 'should have hands that follow the sequence 7 - 1 - 7' do
	    @gs = GameService.new
	    game = @gs.start_game(1,{"0"=>"1", "1"=>"3"})
	    expect(game.hands[0].no_of_cards).to eql(7)
	    expect(game.hands[1].no_of_cards).to eql(6)
	    expect(game.hands[2].no_of_cards).to eql(5)
	    expect(game.hands[3].no_of_cards).to eql(4)
	    expect(game.hands[4].no_of_cards).to eql(3)
	    expect(game.hands[5].no_of_cards).to eql(2)
	    expect(game.hands[6].no_of_cards).to eql(1)
	    expect(game.hands[7].no_of_cards).to eql(2)
	    expect(game.hands[8].no_of_cards).to eql(3)
	    expect(game.hands[9].no_of_cards).to eql(4)
	    expect(game.hands[10].no_of_cards).to eql(5)
	    expect(game.hands[11].no_of_cards).to eql(6)
	    expect(game.hands[12].no_of_cards).to eql(7)
	end
	it 'should have hands that run in sequence' do
		@gs = GameService.new
		game = @gs.start_game(1,{"0"=>"1", "1"=>"3"})
		expect(game.hands[0].sequence).to eql(1)
		expect(game.hands[1].sequence).to eql(2)
		expect(game.hands[2].sequence).to eql(3)
		expect(game.hands[3].sequence).to eql(4)
		expect(game.hands[4].sequence).to eql(5)
		expect(game.hands[5].sequence).to eql(6)
		expect(game.hands[6].sequence).to eql(7)
		expect(game.hands[7].sequence).to eql(8)
		expect(game.hands[8].sequence).to eql(9)
		expect(game.hands[9].sequence).to eql(10)
		expect(game.hands[10].sequence).to eql(11)
		expect(game.hands[11].sequence).to eql(12)
		expect(game.hands[12].sequence).to eql(13)
	end
	describe 'type' do
		describe 'winner' do
			it 'should have first hand as random and all others as "To be chosen""' do
				@g = GameService.new
				game = @g.start_game(2,{"0"=>"1", "1"=>"3"})
				expect(game.hands[0].suit_id).to be > 1
				expect(game.hands[1].suit.name).to eql(Suit.TBC)
				expect(game.hands[2].suit.name).to eql(Suit.TBC)
				expect(game.hands[3].suit.name).to eql(Suit.TBC)
				expect(game.hands[4].suit.name).to eql(Suit.TBC)
				expect(game.hands[5].suit.name).to eql(Suit.TBC)
				expect(game.hands[6].suit.name).to eql(Suit.TBC)
				expect(game.hands[7].suit.name).to eql(Suit.TBC)
				expect(game.hands[8].suit.name).to eql(Suit.TBC)
				expect(game.hands[9].suit.name).to eql(Suit.TBC)
				expect(game.hands[10].suit.name).to eql(Suit.TBC)
				expect(game.hands[11].suit.name).to eql(Suit.TBC)
				expect(game.hands[12].suit.name).to eql(Suit.TBC)
			end
		end
		describe 'Random' do
			it 'should have all hands as random' do
				@g = GameService.new
				game = @g.start_game(1,{"0"=>"1", "1"=>"3"})
				expect(game.hands[0].suit_id).to be > 1
				expect(game.hands[1].suit_id).to be > 1
				expect(game.hands[2].suit_id).to be > 1
				expect(game.hands[3].suit_id).to be > 1
				expect(game.hands[4].suit_id).to be > 1
				expect(game.hands[5].suit_id).to be > 1
				expect(game.hands[6].suit_id).to be > 1
				expect(game.hands[7].suit_id).to be > 1
				expect(game.hands[8].suit_id).to be > 1
				expect(game.hands[9].suit_id).to be > 1
				expect(game.hands[10].suit_id).to be > 1
				expect(game.hands[11].suit_id).to be > 1
				expect(game.hands[12].suit_id).to be > 1
			end
		end
	end
end	