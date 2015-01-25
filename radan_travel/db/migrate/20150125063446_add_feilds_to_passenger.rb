class AddFeildsToPassenger < ActiveRecord::Migration
  def change
    add_column :passengers, :gender, :string
    add_column :passengers, :Marital_status, :string
  end
end
