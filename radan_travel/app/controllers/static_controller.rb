class StaticController < ApplicationController  
  before_filter :set_locale
  def home
  end
  def index
    @tours = Tour.all
     
  end
end
