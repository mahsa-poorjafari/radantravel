class AddCodeSourceToTour < ActiveRecord::Migration
  def change
    add_column :tours, :package_code, :string
    add_column :tours, :tour_source, :text
  end
end
