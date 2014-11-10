class AddFieldToTour < ActiveRecord::Migration
  def change
    add_column :tours, :itinerary_fa, :text
    add_column :tours, :itinerary_en, :text
    add_column :tours, :itinerary_ar, :text
    add_column :tours, :documents_fa, :text
    add_column :tours, :documents_en, :text
    add_column :tours, :documents_ar, :text
  end
end
