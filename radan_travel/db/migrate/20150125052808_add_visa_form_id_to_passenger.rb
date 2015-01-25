class AddVisaFormIdToPassenger < ActiveRecord::Migration
  def change
    add_column :passengers, :visa_form_id, :integer
  end
end
