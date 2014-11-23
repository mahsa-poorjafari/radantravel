class AddAttachmentDecriptionImageToTours < ActiveRecord::Migration
  def self.up
    change_table :tours do |t|
      t.attachment :decription_image
    end
  end

  def self.down
    remove_attachment :tours, :decription_image
  end
end
