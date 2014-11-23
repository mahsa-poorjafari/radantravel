class AddUserEmailToTourComment < ActiveRecord::Migration
  def change
    add_column :tour_comments, :user_email, :string
  end
end
