class StaticController < ApplicationController  
  before_filter :set_locale
  def home
  end
  def index
    @tours = Tour.all
     
  end
  def google46bde3a8d7d48d7d
  end
  def sitemap
    respond_to do |format|
      format.xml
    end
  end
  def BingSiteAuth
    respond_to do |format|
      format.xml
    end
  end
end
