class AddCountryIdToSight < ActiveRecord::Migration
  def change
    add_column :sights, :country_id, :integer
    add_column :sights, :city_id, :integer
  end
end
