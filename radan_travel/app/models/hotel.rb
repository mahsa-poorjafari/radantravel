# encoding: UTF-8
class Hotel < ActiveRecord::Base
  belongs_to :city
  has_many :tours
  has_many :photos, dependent: :destroy
end
