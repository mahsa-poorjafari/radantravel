class AddNewFieldToLocationtour < ActiveRecord::Migration
  def change
    add_column :locationtours, :price_three_bed, :string    
  end
end
