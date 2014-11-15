# encoding: UTF-8
class Customer < ActiveRecord::Base
  extend FriendlyId  
  friendly_id :name
  has_attached_file :image, :styles => { :original => "200x150>" , :small => "100x50>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  #validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => 'ایمیل نامعتبر است.' } 
  
  def self.seach_in_club(customer_name)
    country_condition = "%" + customer_name + "%"  
    country_condition.blank? ? all : where("name LIKE ? ", country_condition)
  end
end
