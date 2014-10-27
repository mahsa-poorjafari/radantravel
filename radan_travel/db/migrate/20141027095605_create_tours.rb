class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :title_fa
      t.string :title_en
      t.string :title_ar
      t.string :description_fa
      t.string :description_en
      t.string :description_ar
      t.integer :plane_id
      t.integer :hotel_id
      t.integer :country_id
      t.integer :city_id
      t.integer :price
      t.date :validate_date_from
      t.date :validate_date_until
      t.boolean :coming_soon, default: false

      t.timestamps
    end
  end
end
