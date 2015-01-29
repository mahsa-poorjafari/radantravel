# encoding: UTF-8
class ContinentCategory < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :title_en
  has_many :tours
  has_many :countries
  has_attached_file :icon, :styles => { :original => "70x65>" , :medium => "45x45>", :small => "30x30>"}
  validates_attachment_content_type :icon, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  validates_attachment :icon, 
    :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/png"], :message => "فرمت عکس آیکن صحیح نمی باشد." },
    :size => { :in => 0..20.kilobytes , :message => "حجم تصویر آیکن بیشتر از ۲۰ کیلوبایت است."}
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
