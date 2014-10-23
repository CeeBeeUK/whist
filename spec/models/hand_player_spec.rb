require 'spec_helper'

describe HandPlayer do
  let(:handPlayer) {build(:hand_player)}
  it 'should pass factory build' do
    expect(handPlayer).to be_valid
  end

  it 'should allow numeric input for bids' do
    handPlayer.bid=1
    expect(handPlayer).to be_valid
  end

  it 'should fail if non numeric values added for bids' do
    handPlayer.bid='fail'
    expect(handPlayer).to be_invalid
  end

  describe 'associations' do
    it 'should describe the player' do
      expect(handPlayer).to respond_to(:player)
    end
    it 'should respond to hand' do
      expect(handPlayer).to respond_to(:hand)
    end
  end
end