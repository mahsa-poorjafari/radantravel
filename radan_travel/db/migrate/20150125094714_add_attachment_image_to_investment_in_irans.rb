class AddAttachmentImageToInvestmentInIrans < ActiveRecord::Migration
  def self.up
    change_table :investment_in_irans do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :investment_in_irans, :image
  end
end
