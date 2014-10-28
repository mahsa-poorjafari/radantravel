# encoding: UTF-8
class City < ActiveRecord::Base
  belongs_to :country
  has_many :hotels, dependent: :destroy
  has_many :sights, dependent: :destroy
  has_many :photos, dependent: :destroy
end
