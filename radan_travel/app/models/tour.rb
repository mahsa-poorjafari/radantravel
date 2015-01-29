# encoding: UTF-8
class Tour < ActiveRecord::Base
  before_validation { self.decription_image.destroy if @delete_image }
  extend FriendlyId  
  friendly_id :title_fa
  extend PersianNumbers
  
  persian_dates :validate_date_from, :validate_date_until
  #belongs_to :hotel
  belongs_to :plane
  belongs_to :continent_category
  belongs_to :country
  has_many :slides
  has_many :photos, dependent: :destroy
  has_many :locationtours
  has_many :tour_comments
  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true
 
  
  has_attached_file :decription_image, :styles => {  :medium => "450x450>", :small => "300x350>" }  
   validates_attachment :decription_image, 
    :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/png"], :message => "فرمت عکس صحیح می باشد." },
    :size => { :in => 0..300.kilobytes , :message => "حجم تصویر بیشتر از 300 کیلوبایت است."}
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
  
  validates :title_fa, :title_en, :title_ar, :uniqueness => {:message => 'عنوان تکراری است'}  
  validates :title_fa, :title_en, :title_ar,  :country_id, :continent_category_id, :package_code, :presence => {:message => 'فیلدهای ضروری را پرکنید'}  
  
  def delete_image
    @delete_image ||= false
  end

  def delete_image=(value)
    @delete_image  = !value.to_i.zero?
  end
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
  def source
    if I18n.locale == :ar
      self.read_attribute("source_ar")
    elsif I18n.locale == :en
      self.read_attribute("source_en")
    else
      self.read_attribute("source")
    end    
  end
  def travel_type
    if I18n.locale == :ar
      self.read_attribute("travel_type_ar")
    elsif I18n.locale == :en
      self.read_attribute("travel_type_en")
    else
      self.read_attribute("travel_type")
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
