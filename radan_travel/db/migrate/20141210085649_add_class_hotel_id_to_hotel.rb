class AddClassHotelIdToHotel < ActiveRecord::Migration
  def change
    add_column :hotels, :class_hotel_id, :integer
  end
end
