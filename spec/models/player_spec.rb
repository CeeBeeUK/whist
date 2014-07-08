require 'spec_helper'

describe Player do
  let(:player) {build(:player)}

  it 'should pass factory build' do
    expect(player).to be_valid
  end
end