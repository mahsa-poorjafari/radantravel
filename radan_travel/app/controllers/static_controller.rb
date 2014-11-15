class StaticController < ApplicationController
  before_filter :set_locale
  def home
  end
  def index
    @tours = Tour.all
    @contact = Page.find_by_title_en('Contact us')
    p'--------------'
    p params[:locale]
    def set_locale     
      if params[:locale] == "en" 
        I18n.locale = "en" 
      elsif params[:locale] == "ar" 
        I18n.locale = "ar"
      else
        I18n.locale = "fa"
      end
      Rails.application.routes.default_url_options[:locale] = I18n.locale 
    end     
  end
end
