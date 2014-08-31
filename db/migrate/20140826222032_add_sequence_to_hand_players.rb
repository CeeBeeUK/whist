class AddSequenceToHandPlayers < ActiveRecord::Migration
  def change
    add_column :hand_players, :sequence, :integer
  end
end
