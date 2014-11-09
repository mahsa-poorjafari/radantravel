class RemoveDescriptionFieldFromTour < ActiveRecord::Migration
  def change
    remove_column :tours, :description_fa, :string
    remove_column :tours, :description_en, :string
    remove_column :tours, :description_ar, :string
  end
end
