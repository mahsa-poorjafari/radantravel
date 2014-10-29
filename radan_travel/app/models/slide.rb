# encoding: UTF-8
class Slide < ActiveRecord::Base
  has_attached_file :image, :styles => { :slide_size => "1280x650>" , :medium => "1080x450>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  
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
