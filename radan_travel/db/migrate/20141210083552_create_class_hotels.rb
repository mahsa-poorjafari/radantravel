class CreateClassHotels < ActiveRecord::Migration
  def change
    create_table :class_hotels do |t|
      t.string :title

      t.timestamps
    end
  end
end
