# encoding: UTF-8
class PdfInvestment < ActiveRecord::Base
  belongs_to :investment_in_iran
  
  has_attached_file :pdf_file,
                    :url  => "/assets/circulars/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/circulars/:id/:style/:basename.:extension"
  
  validates_attachment_content_type :pdf_file,
      
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
