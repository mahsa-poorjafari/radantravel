class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :title_fa
      t.string :title_en
      t.string :title_ar
      t.text :text_fa
      t.text :text_en
      t.text :text_ar
      t.integer :city_id
      t.integer :hotel_grade
      t.string :hotel_facilities

      t.timestamps
    end
  end
end
