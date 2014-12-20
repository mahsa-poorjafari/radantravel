class RemoveSlideTypeFromSlide < ActiveRecord::Migration
  def change
    remove_column :slides, :slide_type, :integer
  end
end
