class AddDescriptionToLocationtour < ActiveRecord::Migration
  def change
    add_column :locationtours, :description, :string
  end
end
