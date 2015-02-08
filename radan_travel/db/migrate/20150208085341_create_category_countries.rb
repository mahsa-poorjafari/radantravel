class CreateCategoryCountries < ActiveRecord::Migration
  def change
    create_table :category_countries do |t|
      t.string :title_en
      t.string :title_fa
      t.string :title_ar

      t.timestamps
    end
  end
end
