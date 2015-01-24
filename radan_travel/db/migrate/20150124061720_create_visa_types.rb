class CreateVisaTypes < ActiveRecord::Migration
  def change
    create_table :visa_types do |t|
      t.string :title_en
      t.string :title_fa
      t.string :title_ar
      t.text :text_en
      t.text :text_fa
      t.text :text_ar

      t.timestamps
    end
  end
end
