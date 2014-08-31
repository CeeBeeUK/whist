require 'spec_helper'

describe Game do
	let(:game) {build(:game)}
  values_seed
  it 'should pass factory build' do
    expect(game).to be_valid
  end

  it 'should have a player list starting with the first dealer' do
    player1 = Player.create(name: 'PlayerOne')
    player2 = Player.create(name: 'PlayerTwo')
    player3 = Player.create(name: 'PlayerThree')
    player4 = Player.create(name: 'PlayerFour')
    @gs = GameService.new
    game = @gs.start_game(1,{"0"=>player2.id, "1"=>player3.id, "2"=>player4.id, "3"=>player1.id})
    expect(game).to be_valid
    expect(game.player_list[0].name).to eql('PlayerTwo')
  end
  it 'should have a status indicator for setup,  in progress and complete' do
    expect(game.status_id).to eql(1)
    expect(game.status.name).to eql(Status.UNSTARTED)
  end

  it 'should have 13 hands once saved' do
    @gs = GameService.new
    @player_ids={"0"=>"1", "1"=>"3"}
    game = @gs.start_game(1, @player_ids)
    expect(game.hands.size).to eql(13)
  end

  it 'should have a trump type' do
    expect(game.trump_type_id).to eql(1)
    expect(game.trump_type.name).to eql(TrumpType.WINNER)
  end
  
  it 'should expose the next round to start'do
    @gs = GameService.new
    game = @gs.start_game(1,{"0"=>"1", "1"=>"3"})
    expect(game.next_round).to eql(1)
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