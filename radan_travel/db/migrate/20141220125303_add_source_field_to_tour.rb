class AddSourceFieldToTour < ActiveRecord::Migration
  def change
    add_column :tours, :source, :string
    add_column :tours, :travel_type, :string
  end
end
