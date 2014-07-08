require 'spec_helper'

describe Game do
	let(:game) {build(:game)}

	it 'should let me create a new game' do
		expect(game).to be_valid
  end

	it 'should have 2 - 7 players'
  it 'should have 13 hands'
  it 'should follow the sequence 7 - 1 - 7'

  it 'should have a trump type' do
    expect(game.trump_type_id).to eql(1)
    expect(game.trump_type.name).to eql('Random')
  end

  it 'should let me start the game'

  describe 'associations' do
    it 'should describe the trump type' do
      expect(game).to respond_to(:trump_type)
    end
  end
end