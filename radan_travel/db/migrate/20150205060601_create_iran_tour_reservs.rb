class CreateIranTourReservs < ActiveRecord::Migration
  def change
    create_table :iran_tour_reservs do |t|
      t.string :fisrt_name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.string :mobile
      t.string :fax
      t.date :start_date
      t.boolean :date_flexible,         default: false
      t.integer :adults_no
      t.integer :children_no
      t.integer :infants_no
      t.text :remarks

      t.timestamps
    end
  end
end
