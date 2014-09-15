require 'spec_helper'

describe TrumpType do
	let(:trump) {build(:trump_type)}
	values_seed
	
	it 'should pass factory build' do
		expect(trump).to be_valid
	end

	it 'should return "WinnerPicks" if started as 1' do
		expect(TrumpType.find(1).name).to eql('WinnerPicks')
	end
	it 'should return "Random" if started as 1' do
		expect(TrumpType.find(2).name).to eql('Random')
	end
	
	describe 'associations' do
	    it 'should have a name attribute' do
	      	expect(trump).to respond_to(:name)
	    end
	    it 'should have a collection of games' do
	      	expect(trump).to respond_to(:games)
	    end
    end
end