class AddAttachmentLogoToPlanes < ActiveRecord::Migration
  def self.up
    change_table :planes do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :planes, :logo
  end
end
