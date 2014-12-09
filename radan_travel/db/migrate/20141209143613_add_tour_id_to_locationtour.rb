class AddTourIdToLocationtour < ActiveRecord::Migration
  def change
    add_column :locationtours, :tour_id, :integer
  end
end
