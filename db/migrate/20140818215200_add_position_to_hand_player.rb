class AddPositionToHandPlayer < ActiveRecord::Migration
  def change
    add_column :hand_players, :position, :integer
  end
end
