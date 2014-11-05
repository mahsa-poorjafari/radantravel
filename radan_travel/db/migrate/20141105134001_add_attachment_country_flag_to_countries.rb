class AddAttachmentCountryFlagToCountries < ActiveRecord::Migration
  def self.up
    change_table :countries do |t|
      t.attachment :country_flag
    end
  end

  def self.down
    remove_attachment :countries, :country_flag
  end
end
