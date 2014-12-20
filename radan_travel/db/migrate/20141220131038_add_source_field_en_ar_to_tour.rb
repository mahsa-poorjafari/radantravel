class AddSourceFieldEnArToTour < ActiveRecord::Migration
  def change
    add_column :tours, :source_en, :string
    add_column :tours, :travel_type_en, :string
    add_column :tours, :source_ar, :string
    add_column :tours, :travel_type_ar, :string
  end
end
