# encoding: UTF-8
class ContinentCategory < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :title_en
  has_many :tours
  has_many :countries
  has_attached_file :icon, :styles => { :original => "70x65>" , :medium => "45x45>", :small => "30x30>"}
  validates_attachment_content_type :icon, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  def title
    if I18n.locale == :ar
      self.read_attribute("title_ar")
    elsif I18n.locale == :en
      self.read_attribute("title_en")
    else
      self.read_attribute("title_fa")
    end    
  end
end
