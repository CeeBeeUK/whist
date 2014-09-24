require 'spec_helper'

describe Suit do
	let(:suit) {build(:suit)}
	values_seed
	
	it 'should pass factory build' do
		expect(suit).to be_valid
	end

	it 'should return text from find_by_suit' do
		expect(Suit.find_by_suit('Hearts').text).to eql('&hearts;')
	end

	it 'should respond to name requests' do
		expect(Suit.spades).to be_valid
		expect(Suit.hearts).to be_valid
		expect(Suit.clubs).to be_valid
		expect(Suit.diamonds).to be_valid
		expect(Suit.tbc).to be_valid
		expect(Suit.tbc.text).to eql('tbc')
	end

 	describe 'validations' do
		it 'should fail with no name' do
			suit.name=nil
			expect(suit).to be_invalid
		end
		it 'should fail with no text' do
			suit.text=nil
			expect(suit).to be_invalid
		end
	end

	describe 'associations' do
	    it 'should have a name attribute' do
	      	expect(suit).to respond_to(:name)
	    end
	    it 'should have a text attribute' do
      		expect(suit).to respond_to(:text)
	    end
	    it 'should have a hands association' do
    		expect(suit).to respond_to(:hands)
	    end
	end
end
