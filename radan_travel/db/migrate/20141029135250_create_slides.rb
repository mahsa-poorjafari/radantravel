class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :text_fa
      t.string :text_en
      t.string :text_ar

      t.timestamps
    end
  end
end
