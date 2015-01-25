# encoding: UTF-8
class InvestmentInIran < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :title_fa
  has_attached_file :image, :styles => { :original => "700x650>" , :medium => "450x450>", :small => "300x350>", :toursize => "248x370#", :tumb => "120x70" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  has_many :pdf_investments
  accepts_nested_attributes_for :pdf_investments, reject_if: :all_blank, allow_destroy: true
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
