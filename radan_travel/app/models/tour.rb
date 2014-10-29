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
end
