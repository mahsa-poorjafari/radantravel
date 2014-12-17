class AddHoteTypeToHotel < ActiveRecord::Migration
  def change
    add_column :hotels, :hotel_type, :integer
  end
end
