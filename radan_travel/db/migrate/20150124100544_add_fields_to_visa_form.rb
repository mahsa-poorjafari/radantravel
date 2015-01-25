class AddFieldsToVisaForm < ActiveRecord::Migration
  def change
    add_column :visa_forms, :I_agree, :boolean
    add_column :visa_forms, :Incoming_Flight_Departure_Airport, :string
    add_column :visa_forms, :Incoming_Flight_No, :string
    add_column :visa_forms, :Arrival_date, :date
    add_column :visa_forms, :Arrival_City, :string
    add_column :visa_forms, :Outgoing_Fligh_Destination, :string
    add_column :visa_forms, :Outgoing_Flight_No, :string
    add_column :visa_forms, :Departure_date, :date
    add_column :visa_forms, :Departure_City, :string
  end
end
