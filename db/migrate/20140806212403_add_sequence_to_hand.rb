class AddSequenceToHand < ActiveRecord::Migration
  def change
    add_column :hands, :sequence, :integer
  end
end
