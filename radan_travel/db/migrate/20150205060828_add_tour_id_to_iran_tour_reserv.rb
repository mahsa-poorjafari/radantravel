class AddTourIdToIranTourReserv < ActiveRecord::Migration
  def change
    add_column :iran_tour_reservs, :tour_id, :integer
    add_column :iran_tour_reservs, :track_code, :string
  end
end
