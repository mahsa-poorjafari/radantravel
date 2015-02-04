# encoding: UTF-8
class VisaForm < ActiveRecord::Base
  has_many :passengers
  accepts_nested_attributes_for :passengers, reject_if: :all_blank, allow_destroy: true
  validates :I_agree, :presence => {:message => 'Please Check The Visa process agreement'}
end
