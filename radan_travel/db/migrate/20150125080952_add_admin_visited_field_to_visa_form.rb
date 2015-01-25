class AddAdminVisitedFieldToVisaForm < ActiveRecord::Migration
  def change
    add_column :visa_forms, :admin_visited, :boolean,         default: false
  end
end
