class CreateHandPlayers < ActiveRecord::Migration
  def change
    create_table :hand_players do |t|
      t.integer :game_id
      t.integer :hand_id
      t.integer :player_id
      t.integer :bid
      t.integer :won
      t.integer :score
      t.timestamps
    end
  end
end
