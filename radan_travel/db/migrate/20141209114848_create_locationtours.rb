class CreateLocationtours < ActiveRecord::Migration
  def change
    create_table :locationtours do |t|
      t.integer :hotel_id
      t.integer :city_id
      t.decimal :price, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
