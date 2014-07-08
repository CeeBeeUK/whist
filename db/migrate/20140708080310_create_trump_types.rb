class CreateTrumpTypes < ActiveRecord::Migration
  def change
    create_table :trump_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
