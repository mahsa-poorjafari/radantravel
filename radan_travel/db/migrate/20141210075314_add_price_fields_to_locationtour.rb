class AddPriceFieldsToLocationtour < ActiveRecord::Migration
  def change
    add_column :locationtours, :price_two_bed, :string
    add_column :locationtours, :price_one_bed, :string
    add_column :locationtours, :price_kid_and_bed, :string
    add_column :locationtours, :price_kid_without_bed, :string
  end
end
