# encoding: UTF-8
class Photo < ActiveRecord::Base
  belongs_to :city
  belongs_to :country
  belongs_to :sight
  belongs_to :tour
  belongs_to :hotel
end
