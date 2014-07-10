require 'spec_helper'

describe Player do
  let(:player) {build(:player)}

  it 'should pass factory build' do
    expect(player).to be_valid
  end

  describe 'validations' do
    it 'should enforce a name' do
      player.name=nil
      expect(player).to be_invalid
    end
  end
end