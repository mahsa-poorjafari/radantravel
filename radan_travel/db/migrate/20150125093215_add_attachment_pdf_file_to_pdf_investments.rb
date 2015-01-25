class AddAttachmentPdfFileToPdfInvestments < ActiveRecord::Migration
  def self.up
    change_table :pdf_investments do |t|
      t.attachment :pdf_file
    end
  end

  def self.down
    remove_attachment :pdf_investments, :pdf_file
  end
end
