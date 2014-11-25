# encoding: UTF-8
class Tour < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :title_fa
  extend PersianNumbers
  
  persian_dates :validate_date_from, :validate_date_until
  belongs_to :hotel
  belongs_to :plane
  belongs_to :city
  
  has_many :photos, dependent: :destroy
  has_many :tour_comments
  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true
  
  has_attached_file :decription_image, :styles => {  :medium => "450x450>", :small => "300x350>" }
  validates_attachment_content_type :decription_image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  
  has_attached_file :info,
                    :url  => "/assets/circulars/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/circulars/:id/:style/:basename.:extension"
  
  validates_attachment_content_type :info,
      
      :content_type => ['application/txt', 'text/plain',
      'application/pdf', 'application/msword',
      'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
      'application/vnd.oasis.opendocument.text',
      'application/x-vnd.oasis.opendocument.text',
      'application/rtf', 'application/x-rtf', 'text/rtf', 
      'text/richtext', 'application/doc', 'application/docx', 'application/x-soffice', 'application/octet-stream',
      "image/jpg", "image/jpeg", "image/png"] ,
      
      :message => "نوع فایل نامعتبر است. "
  
  def title
    if I18n.locale == :ar
      self.read_attribute("title_ar")
    elsif I18n.locale == :en
      self.read_attribute("title_en")
    else
      self.read_attribute("title_fa")
    end    
  end
  
  def description
    if I18n.locale == :ar
      self.read_attribute("description_ar")
    elsif I18n.locale == :en
      self.read_attribute("description_en")
    else
      self.read_attribute("description_fa")
    end    
  end
  def documents
    if I18n.locale == :ar
      self.read_attribute("documents_ar")
    elsif I18n.locale == :en
      self.read_attribute("documents_en")
    else
      self.read_attribute("documents_fa")
    end    
  end
  def itinerary
    if I18n.locale == :ar
      self.read_attribute("itinerary_ar")
    elsif I18n.locale == :en
      self.read_attribute("itinerary_en")
    else
      self.read_attribute("itinerary_fa")
    end    
  end
  
  
  
  def self.by_country(country)    
    country_condition = "%" + country + "%"  
    country_condition.blank? ? all : where("title_fa LIKE ? OR title_en LIKE ? OR title_ar LIKE ?", country_condition,country_condition,country_condition)
  end
  def self.by_price(amount)    
    amount.blank? ? all : where("price>#{amount}")
  end
  def self.by_start_date(start_date)
    
    start_date.blank? ? all : where(validate_date_from:  start_date..start_date + 1.month)
  end
  def self.by_exp_date(exp_date)    
    
    exp_date.blank? ? all : where(validate_date_until:  exp_date..exp_date + 1.month)
  end
  
end
