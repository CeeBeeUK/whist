def values_seed
	let!(:confirmed) { create(:suit, name:Suit.TBC,text:'tbc') }
	let!(:spades) { create(:suit, name: Suit.SPADES, text: '&spades;') }
	let!(:hearts) { create(:suit, name: Suit.HEARTS, text:'&hearts;') }
	let!(:clubs) { create(:suit, name: Suit.CLUBS, text:'&clubs;') }
	let!(:diamonds) { create(:suit, name: Suit.DIAMONDS, text:'&diams;') }

	let!(:winner) { create(:trump_type, name: TrumpType.WINNER)}
	let!(:random) { create(:trump_type, name: TrumpType.RANDOM)}

	let!(:unstarted) { create(:status, name: Status.UNSTARTED)}
	let!(:inprogress) { create(:status, name: Status.IN_PROGRESS)}
	let!(:complete) { create(:status, name: Status.COMPLETE)}
end