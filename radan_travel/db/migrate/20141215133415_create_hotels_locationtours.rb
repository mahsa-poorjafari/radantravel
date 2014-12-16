class CreateHotelsLocationtours < ActiveRecord::Migration
  def change
    create_table :hotels_locationtours do |t|
      t.integer :hotel_id
      t.integer :locationtour_id

      t.timestamps
    end
  end
end
