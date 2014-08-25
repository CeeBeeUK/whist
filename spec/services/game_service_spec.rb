require 'spec_helper'

describe GameService do
	values_seed
	it 'should create hands with sequential dealers' do

		player1 = Player.create(name: 'PlayerOne')
		player2 = Player.create(name: 'PlayerTwo')
		player3 = Player.create(name: 'PlayerThree')
		player4 = Player.create(name: 'PlayerFour')

    	@gs = GameService.new
	    game = @gs.start_game_plus(1,{"0"=>player2.id, "1"=>player3.id, "2"=>player4.id, "3"=>player1.id})
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
	    expect(game.hands[12].dealer.name).to eql(player2.name)
	end
end	