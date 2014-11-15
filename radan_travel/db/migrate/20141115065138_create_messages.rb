class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :user_name
      t.string :email
      t.string :phone
      t.text :text

      t.timestamps
    end
  end
end
