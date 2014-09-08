require 'spec_helper'

describe Hand do
	let(:new_hand) {build(:hand)}
	values_seed

	it 'should pass factory build' do		
		expect(new_hand).to be_valid
	end
	it "should have between 1 and 7 cards" do
		expect(new_hand).to be_valid
		new_hand.no_of_cards = 7
		expect(new_hand).to be_valid
	end
	it 'should tell me the current trump suit' do
		new_hand.suit = Suit.find_by(name:Suit.SPADES)
		expect(new_hand.suit_id).to eql(2)
		expect(new_hand.suit.name).to eql(Suit.SPADES)
	end
	it 'should have a sequence within the game' do
		expect(new_hand.sequence).to eql(1)
	end
	it 'should have a dealer' do
		expect(new_hand.dealer_id).to eql(1)
	end
	it 'should have a status of unstarted upon creation' do
		expect(new_hand.status.name).to eql(Status.UNSTARTED)
	end
	it 'should have a status of inprogress while playing' do
		player1 = Player.create(name: 'PlayerOne')
		player2 = Player.create(name: 'PlayerTwo')
		player3 = Player.create(name: 'PlayerThree')
		player4 = Player.create(name: 'PlayerFour')
	    @gs = GameService.new
	    game = @gs.start_game(1,{"0"=>player2.id, "1"=>player3.id, "2"=>player4.id, "3"=>player1.id})
	    first = game.hands.first
	    @gs.set_bid(first, first.hand_players[0] ,1)		
		expect(first.status_id).to eql(Status.in_progress.id)
		expect(first.status.name).to eql(Status.IN_PROGRESS)
	end
	it 'should have a status of complete when finished' do

	end
	it 'should not let the final bid equal the no of cards' do
		player1 = Player.create(name: 'PlayerOne')
		player2 = Player.create(name: 'PlayerTwo')
		player3 = Player.create(name: 'PlayerThree')
		player4 = Player.create(name: 'PlayerFour')
	    @gs = GameService.new
	    game = @gs.start_game(1,{"0"=>player2.id, "1"=>player3.id, "2"=>player4.id, "3"=>player1.id})
	    expect(game).to be_valid
	    first = game.hands.first
	    expect(first).to be_valid
	    expect(first.bid_total).to eql(0)
	    @gs.set_bid(first, first.hand_players[0] ,1)
	    @gs.set_bid(first, first.hand_players[1], 2)
	    @gs.set_bid(first, first.hand_players[2], 2)
	    expect {
    		@gs.set_bid(first, first.hand_players[3], 2)
    	}.to raise_error()
    	expect(first.bid_count).to eql(3)
	end
	describe 'validations' do
		it 'should not allow cards to be less than 1' do
			new_hand.no_of_cards = 0
			expect(new_hand).to be_invalid
		end

		it 'should not allow cards to be greater than 7' do
			new_hand.no_of_cards=8
			expect(new_hand).to be_invalid
    	end
    	it 'should have a trump suit' do
      		new_hand.suit_id = nil
      		expect(new_hand).to be_invalid
    	end
  	end
	describe 'associations' do
    	it 'should describe the trump suit' do
      		expect(new_hand).to respond_to(:suit)
    	end
    	it 'should include a bid total that sums hand_player bid totals' do
    		expect(new_hand).to respond_to(:bid_total)
    	end
  	end
end	
