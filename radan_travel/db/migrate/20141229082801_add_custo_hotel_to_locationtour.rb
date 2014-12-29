class AddCustoHotelToLocationtour < ActiveRecord::Migration
  def change
    add_column :locationtours, :custom_hotel, :string
  end
end
