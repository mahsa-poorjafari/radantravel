# encoding: UTF-8
class Plane < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :title_en
  has_attached_file :logo, :styles => { :original => "700x650>" , :small => "200x200>", :icon => "50x50>" }
  validates_attachment_content_type :logo, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  def title
    if I18n.locale == :ar
      self.read_attribute("title_ar")
    elsif I18n.locale == :en
      self.read_attribute("title_en")
    else
      self.read_attribute("title_fa")
    end    
  end
  
  def text
    if I18n.locale == :ar
      self.read_attribute("text_ar")
    elsif I18n.locale == :en
      self.read_attribute("text_en")
    else
      self.read_attribute("text_fa")
    end    
  end
end
