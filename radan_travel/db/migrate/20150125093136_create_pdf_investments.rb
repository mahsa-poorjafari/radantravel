class CreatePdfInvestments < ActiveRecord::Migration
  def change
    create_table :pdf_investments do |t|
      t.string :title_en
      t.string :title_fa
      t.string :title_ar
      t.text :text_en
      t.text :text_fa
      t.text :text_ar
      t.integer :investment_in_iran_id

      t.timestamps
    end
  end
end
