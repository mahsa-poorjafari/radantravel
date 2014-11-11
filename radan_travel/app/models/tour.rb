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
  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true
  
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
  
  def self.search(country, price, start_date, exp_date)
    country_condition = "%" + country + "%"  
    price_condition = "%" + price + "%"      
    start_date_condition = Date.parse(start_date)
    if country_condition
      self.where("title_fa LIKE ? OR title_en LIKE ? OR title_ar LIKE ?", country_condition, country_condition, country_condition)
      #find(:all, :conditions => ['title_fa LIKE ? OR title_en LIKE ? OR title_ar LIKE ?', country_condition, country_condition, country_condition])    
    end
    if price_condition
      self.where("price LIKE ? ", price_condition)
    end
    if start_date_condition
      p  self.where(:validate_date_from => start_date_condition.beginning_of_day..start_date_condition.end_of_day)
    
    end   
    
  end
end
