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

  it 'should have a trump suit'

	describe 'validations' do
		it 'should not allow cards to be less than 1' do
			new_hand.no_of_cards = 0
			expect(new_hand).to be_invalid
		end

		it 'should not allow cards to be greater than 7' do
			new_hand.no_of_cards=8
			expect(new_hand).to be_invalid
		end
	end
end	
