class RemovePriceFromLocationtour < ActiveRecord::Migration
  def change
    remove_column :locationtours, :price, :decimal
  end
end
