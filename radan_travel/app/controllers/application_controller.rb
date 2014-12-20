class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception  
  before_filter :set_locale, :online_info
  before_filter :load_slides
  include ApplicationHelper
 
  protected
    def check_autentication
      redirect_to :root unless current_user.role_id == 1
    end
    def default_url_options
      { :locale => I18n.locale }
    end
  private
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
    
    def online_info
      @online_day = Visit.where(started_at:  Date.today.beginning_of_day..Date.today.end_of_day).count
      @online_now = Visit.where(started_at:  1.hour.ago..Time.now).count
      @contact = Page.find_by_title_en('Contact us')
    end
    def load_slides
      p '------------------print tours slide----------------'
      @tour_slides = Slide.where(slide_type: 1)
      p @tour_slides.count
      p '------------------print hotel slide----------------'
      @hotel_slides = Slide.where(slide_type: 2)
      p @hotel_slides.count
       p '------------------print visit iran slide----------------'
      @iran_slides = Slide.where(slide_type: 3)
      p @iran_slides.count
      p '------------------print other slide----------------'
      @general_slides = Slide.where('slide_type=? OR slide_type=?', nil, 4)      
      p  @general_slides.count
    end
end
