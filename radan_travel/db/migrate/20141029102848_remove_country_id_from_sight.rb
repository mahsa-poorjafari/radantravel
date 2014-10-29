class RemoveCountryIdFromSight < ActiveRecord::Migration
  def change
    remove_column :sights, :country_id, :integer
  end
end
