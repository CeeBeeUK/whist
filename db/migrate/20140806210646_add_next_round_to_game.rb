class AddNextRoundToGame < ActiveRecord::Migration
  def change
    add_column :games, :next_round, :integer
  end
end
