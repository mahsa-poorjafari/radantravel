# encoding: UTF-8
class Country < ActiveRecord::Base
  has_attached_file :country_flag, :styles => { :original => "200x250>" , :small => "30x35#" }
  validates_attachment_content_type :country_flag, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  extend FriendlyId  
  friendly_id :title_en
  has_many :cities, dependent: :destroy
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true
  belongs_to :continent_category
  has_many :tours
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
