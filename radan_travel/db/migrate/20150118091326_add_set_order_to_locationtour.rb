class AddSetOrderToLocationtour < ActiveRecord::Migration
  def change
    add_column :locationtours, :set_order, :integer,     default: 100
  end
end
