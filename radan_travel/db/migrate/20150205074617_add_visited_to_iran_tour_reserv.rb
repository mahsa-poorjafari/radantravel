class AddVisitedToIranTourReserv < ActiveRecord::Migration
  def change
    add_column :iran_tour_reservs, :visited, :boolean,         default: false
  end
end
