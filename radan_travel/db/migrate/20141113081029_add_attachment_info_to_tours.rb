class AddAttachmentInfoToTours < ActiveRecord::Migration
  def self.up
    change_table :tours do |t|
      t.attachment :info
    end
  end

  def self.down
    remove_attachment :tours, :info
  end
end
