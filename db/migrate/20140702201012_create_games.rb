class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :trump_type_id
      t.integer :winner_id
      t.integer :score
      t.integer :status_id
      t.timestamps
    end
  end
end
