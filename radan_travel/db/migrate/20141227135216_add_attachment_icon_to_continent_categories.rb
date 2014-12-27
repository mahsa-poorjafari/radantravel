class AddAttachmentIconToContinentCategories < ActiveRecord::Migration
  def self.up
    change_table :continent_categories do |t|
      t.attachment :icon
    end
  end

  def self.down
    remove_attachment :continent_categories, :icon
  end
end
