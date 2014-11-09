class AddDescriptionFieldToTour < ActiveRecord::Migration
  def change
    add_column :tours, :description_fa, :text
    add_column :tours, :description_en, :text
    add_column :tours, :description_ar, :text
  end
end
