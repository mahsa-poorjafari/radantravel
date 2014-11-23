class CreateTourComments < ActiveRecord::Migration
  def change
    create_table :tour_comments do |t|
      t.string :user_name
      t.integer :tour_id
      t.text :text

      t.timestamps
    end
  end
end
