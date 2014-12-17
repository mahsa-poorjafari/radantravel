class AddContinentCategoryIdToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :continent_category_id, :integer
  end
end
