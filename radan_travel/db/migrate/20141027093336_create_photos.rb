class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :description_fa
      t.string :description_en
      t.string :description_ar
      t.integer :sight_id

      t.timestamps
    end
  end
end
