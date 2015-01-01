# encoding: UTF-8
class Hotel < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :title_en
  belongs_to :city
  belongs_to :class_hotel
  has_many :tours
  has_many :photos, dependent: :destroy
  has_many :slides
  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true
  has_and_belongs_to_many :locationtours
  validates :city_id, :hotel_type, :presence => {:message => 'فیلدهای ضروری را پر کنید'}
  
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
