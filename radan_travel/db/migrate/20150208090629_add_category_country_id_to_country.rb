class AddCategoryCountryIdToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :category_country_id, :integer
  end
end
