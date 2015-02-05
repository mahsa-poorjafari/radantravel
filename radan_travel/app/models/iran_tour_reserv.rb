# encoding: UTF-8
class IranTourReserv < ActiveRecord::Base
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => 'Email Is Not Valid' } 
  validates :fisrt_name, :last_name, :phone_number, :email, :remarks, :presence => {:message => 'Please Fill The Necessary Fields'}
  
end
