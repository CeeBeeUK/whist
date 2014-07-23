class CreateHands < ActiveRecord::Migration
  def change
    create_table :hands do |t|
      t.integer :game_id
      t.integer :no_of_cards
      t.integer :suit_id
      t.timestamps
    end
  end
end
