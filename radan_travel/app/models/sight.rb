# encoding: UTF-8
class Sight < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :title_fa
  has_many :photos
  belongs_to :city
  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true
  validates :title_fa, :title_en, :title_ar, :uniqueness => {:message => 'عنوان تکراری است'}  
  validates :title_fa, :title_en, :title_ar,  :city_id, :presence => {:message => 'فیلدهای ضروری را پرکنید'}  
  
  has_many :slides
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
