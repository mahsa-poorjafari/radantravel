class AddModelIdToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :tour_id, :integer
    add_column :photos, :hotel_id, :integer
    add_column :photos, :country_id, :integer
    add_column :photos, :city_id, :integer
  end
end
