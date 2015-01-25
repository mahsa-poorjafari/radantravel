class CreateVisaForms < ActiveRecord::Migration
  def change
    create_table :visa_forms do |t|
      t.string :request_code
      t.text :visa_agreement
      t.text :important_notes

      t.timestamps
    end
  end
end
