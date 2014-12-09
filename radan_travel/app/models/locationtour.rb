class Locationtour < ActiveRecord::Base
  belongs_to :tour
  belongs_to :hotel  
  belongs_to :city
end
