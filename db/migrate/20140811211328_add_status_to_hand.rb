class AddStatusToHand < ActiveRecord::Migration
  def change
    add_column :hands, :status_id, :integer
    add_column :hands, :dealer, :integer
  end
end
