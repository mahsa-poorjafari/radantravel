class AddNewFieldsToTour < ActiveRecord::Migration
  def change
    add_column :tours, :continent_category_id, :integer
    add_column :tours, :special, :boolean, default: false
  end
end
