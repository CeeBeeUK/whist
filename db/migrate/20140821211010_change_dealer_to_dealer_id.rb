class ChangeDealerToDealerId < ActiveRecord::Migration
  def change
  	rename_column :hands, :dealer, :dealer_id
  end
end
