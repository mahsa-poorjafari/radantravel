class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title_fa
      t.string :title_en
      t.string :title_ar
      t.string :web_site

      t.timestamps
    end
  end
end
