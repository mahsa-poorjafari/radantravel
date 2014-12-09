class CreateCustomTours < ActiveRecord::Migration
  def change
    create_table :custom_tours do |t|
      t.string :user_name
      t.string :user_email
      t.string :country
      t.string :description

      t.timestamps
    end
  end
end
