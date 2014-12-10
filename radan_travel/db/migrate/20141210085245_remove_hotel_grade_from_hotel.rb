class RemoveHotelGradeFromHotel < ActiveRecord::Migration
  def change
    remove_column :hotels, :hotel_grade, :integer
  end
end
