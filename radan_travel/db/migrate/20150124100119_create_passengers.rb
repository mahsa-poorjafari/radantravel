class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.string :First_Name
      t.string :Last_Name
      
      t.date :Date_of_Birth
      t.string :Birth_Place
      t.string :Birth_other_Place
      t.string :Fathers_Name
      t.string :Grand_Fathers_Name
      t.string :Occupation
      t.string :Job_title
      t.string :Your_Company
      t.string :Nationality
      t.string :Previous_Nationality
      t.string :Passport_No
      t.string :Passport_type
      t.string :Date_Of_Passport_Issue
      t.string :Place_Of_Passport_Issue
      t.date :Date_Of_Passport_Expiry
      t.string :Where_collect_your_visa
      t.string :Phone_No
      t.string :Email
      t.string :Duration_Of_Stay_In_Iran
      t.string :Travel_Entrance_To_Iran
      t.string :Times_Have_You_Been_To_Iran
      t.date :date_of_Your_Last_Visit_To_Iran

      t.timestamps
    end
  end
end
