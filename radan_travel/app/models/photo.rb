# encoding: UTF-8
class Photo < ActiveRecord::Base
  has_attached_file :image, :styles => { :original => "700x650>" , :medium => "450x450>", :small => "300x350>", :toursize => "248x370#", :tumb => "120x70" }
  validates_attachment :image, 
    :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/png"], :message => "فرمت عکس صحیح می باشد." },
    :size => { :in => 0..300.kilobytes , :message => "حجم تصویر بیشتر از 300 کیلوبایت است."}
  
  belongs_to :city
  belongs_to :country
  belongs_to :sight
  belongs_to :tour
  belongs_to :hotel
  
end
