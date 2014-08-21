# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :hand do
    no_of_cards 1
    suit_id 2
    dealer_id 1
	add_attribute :sequence, 1
  end
end