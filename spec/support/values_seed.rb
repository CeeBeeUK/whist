def values_seed

	let!(:confirmed) { Suit.find_or_create_by(name:Suit.TBC,text:'tbc') }
	let!(:spades) 	 { Suit.find_or_create_by(name: Suit.SPADES, text: '&spades;') }
	let!(:hearts) 	 { Suit.find_or_create_by(name: Suit.HEARTS, text:'&hearts;') }
	let!(:clubs) 	 { Suit.find_or_create_by(name: Suit.CLUBS, text:'&clubs;') }
	let!(:diamonds)  { Suit.find_or_create_by(name: Suit.DIAMONDS, text:'&diams;') }

	let!(:winner) 	{ TrumpType.find_or_create_by(name: TrumpType.WINNER)}
	let!(:random)	{ TrumpType.find_or_create_by(name: TrumpType.RANDOM)}

	let!(:unstarted) 	{ Status.find_or_create_by(name: Status.UNSTARTED)}
	let!(:inprogress)	{ Status.find_or_create_by(name: Status.IN_PROGRESS)}
	let!(:complete) 	{ Status.find_or_create_by(name: Status.COMPLETE)}
end