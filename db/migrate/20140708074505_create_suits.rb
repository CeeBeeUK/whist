class CreateSuits < ActiveRecord::Migration
  def change
    create_table :suits do |t|
      t.string :name

      t.timestamps
    end
  end
end
