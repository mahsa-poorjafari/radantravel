# encoding: UTF-8
class Link < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :title_en
  has_attached_file :image, :styles => { :original => "700x650>" , :medium => "450x450>", :small => "100x50>" }
  validates_attachment :image, 
    :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/png"], :message => "فرمت عکس صحیح می باشد." },
    :size => { :in => 0..20.kilobytes , :message => "حجم تصویر بیشتر از  ۲۰کیلوبایت است."}
    
  
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
