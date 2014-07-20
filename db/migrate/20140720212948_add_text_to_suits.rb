class AddTextToSuits < ActiveRecord::Migration
  def change
    add_column :suits, :text, :string
  end
end
