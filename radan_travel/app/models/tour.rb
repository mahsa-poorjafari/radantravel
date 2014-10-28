# encoding: UTF-8
class Tour < ActiveRecord::Base
  belongs_to :hotel
  has_many :photos, dependent: :destroy
end
