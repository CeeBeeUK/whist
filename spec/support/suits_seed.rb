def suits_seed
	let!(:confirmed) { create(:suit, name:Suit.TBC,text:'tbc') }
	let!(:spades) { create(:suit, name: Suit.SPADES, text: '&spades;') }
	let!(:hearts) { create(:suit, name: Suit.HEARTS, text:'&hearts;') }
	let!(:clubs) { create(:suit, name: Suit.CLUBS, text:'&clubs;') }
	let!(:diamonds) { create(:suit, name: Suit.DIAMONDS, text:'&diams;') }
end