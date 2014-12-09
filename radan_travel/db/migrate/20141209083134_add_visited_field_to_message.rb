class AddVisitedFieldToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :visited, :boolean, default: false
  end
end
