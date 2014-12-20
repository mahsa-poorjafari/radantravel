class AddSlideTypeToSlide < ActiveRecord::Migration
  def change
    add_column :slides, :slide_type, :integer
  end
end
