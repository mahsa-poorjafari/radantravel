class CreateVisas < ActiveRecord::Migration
  def change
    create_table :visas do |t|
      t.string :title_en
      t.string :title_fa
      t.string :title_ar
      t.text :text_en
      t.text :text_fa
      t.text :text_ar
      t.integer :visa_type_id

      t.timestamps
    end
  end
end
