class AddAttachmentImageToCustomers < ActiveRecord::Migration
  def self.up
    change_table :customers do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :customers, :image
  end
end
