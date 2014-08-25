require 'spec_helper'

describe Game do
	let(:game) {build(:game)}
  values_seed
  it 'should pass factory build' do
    expect(game).to be_valid
  end

  it 'should have a status indicator for setup,  in progress and complete' do
    expect(game.status_id).to eql(1)
    expect(game.status.name).to eql(Status.UNSTARTED)
  end

  it 'should have 13 hands once saved' do
    @gs = GameService.new
    @player_ids={"0"=>"1", "1"=>"3"}
    game = @gs.start_game_plus(1, @player_ids)
    expect(game.hands.size).to eql(13)
  end

  it 'should have hands that follow the sequence 7 - 1 - 7' do
    @gs = GameService.new
    game = @gs.start_game_plus(1,{"0"=>"1", "1"=>"3"})
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

  it 'should have a trump type' do
    expect(game.trump_type_id).to eql(1)
    expect(game.trump_type.name).to eql(TrumpType.WINNER)
  end
  
  it 'should expose the next round to start'do
    @gs = GameService.new
    game = @gs.start_game_plus(1,{"0"=>"1", "1"=>"3"})
    expect(game.next_round).to eql(1)
  end
  it 'should have hands that run in sequence' do
    @gs = GameService.new
    game = @gs.start_game_plus(1,{"0"=>"1", "1"=>"3"})
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
        @g =GameService.new
        game = @g.start_game_plus(2,{"0"=>"1", "1"=>"3"})
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
        @g =GameService.new
        game = @g.start_game_plus(1,{"0"=>"1", "1"=>"3"})
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
  describe 'associations' do
    it 'should describe the trump type' do
      expect(game).to respond_to(:trump_type)
    end
    it 'should have a collection of hands' do
      expect(game).to respond_to(:hands)
    end
    it 'should have a status' do
      expect(game).to respond_to(:status)
    end
    it 'should respond to players' do
      expect(game).to respond_to(:players)
    end
  end
end