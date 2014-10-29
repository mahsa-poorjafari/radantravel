class CreatePlanes < ActiveRecord::Migration
  def change
    create_table :planes do |t|
      t.string :title_fa
      t.string :title_en
      t.string :title_ar
      t.string :text_fa
      t.string :text_en
      t.string :text_ar

      t.timestamps
    end
  end
end
