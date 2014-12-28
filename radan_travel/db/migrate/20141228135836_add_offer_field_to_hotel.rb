class AddOfferFieldToHotel < ActiveRecord::Migration
  def change
    add_column :hotels, :offer, :boolean,     default: false
  end
end
