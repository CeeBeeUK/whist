require 'spec_helper'

describe Hand do
	let(:new_hand) {build(:hand)}

	it 'should pass factory build' do
		expect(new_hand).to be_valid
	end
	it "should have between 1 and 7 cards" do
		expect(new_hand).to be_valid
		new_hand.no_of_cards = 7
		expect(new_hand).to be_valid
	end
	it 'should tell me the current trump suit' do
		expect(new_hand.suit_id).to eql(2)
		expect(new_hand.suit.name).to eql('Spades')
	end
	it 'should have a sequence within the game' do
		expect(new_hand.sequence).to eql(1)
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
  	end
end	
