class AddVisitedFieldToCustomTour < ActiveRecord::Migration
  def change
    add_column :custom_tours, :visited, :boolean, default: false
  end
end
