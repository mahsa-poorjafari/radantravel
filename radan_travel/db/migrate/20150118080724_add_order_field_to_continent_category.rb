class AddOrderFieldToContinentCategory < ActiveRecord::Migration
  def change
    add_column :continent_categories, :set_order, :integer,     default: 0
  end
end
