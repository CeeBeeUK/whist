require 'spec_helper'

describe Game do
	let(:game) {build(:game)}

  it 'should pass factory build' do
    expect(game).to be_valid
  end

	it 'should raise an error if more than 7 players are added' do
    @service = GameService.new
    game = @service.start_game(1)
    game.save
    @service.add_player(game,'test player1')
    @service.add_player(game,'test player 2')
    @service.add_player(game,'test player 3')
    @service.add_player(game,'test player 4')
    @service.add_player(game,'test player 5')
    @service.add_player(game,'test player 6')
    @service.add_player(game,'test player 7')
    expect{@service.add_player(game,'test player 8')}.to raise_error('Too many players')
  end

  it 'should let users add players' do
    @service = GameService.new
    game = @service.start_game(1)
    game.save
    expect(game.player_list.size).to eql(0)
    @service.add_player(game,'test player')
    expect(game.player_list.size).to eql(1)
    @service.add_player(game,'test player 2')
    expect(game.player_list.size).to eql(2)
  end

  it 'should have a status indicator for in progress and complete' do
    expect(game.status_id).to eql(1)
    expect(game.status.name).to eql('In progress')
  end

  it 'should have 13 hands once saved' do
    @gs = GameService.new
    game = @gs.start_game(1)
    expect(game.hands.size).to eql(13)
  end

  it 'should have hands that follow the sequence 7 - 1 - 7' do
    @gs = GameService.new
    game = @gs.start_game(1)
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
    expect(game.trump_type.name).to eql('Random')
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