class AddConfirmCommentToTourComment < ActiveRecord::Migration
  def change
    add_column :tour_comments, :confirm_comment, :boolean, default: false
  end
end
