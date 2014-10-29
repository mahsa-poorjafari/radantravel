# encoding: UTF-8
class Photo < ActiveRecord::Base
  has_attached_file :image, :styles => { :original => "700x650>" , :medium => "450x450>", :small => "300x350>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  belongs_to :city
  belongs_to :country
  belongs_to :sight
  belongs_to :tour
  belongs_to :hotel
end
