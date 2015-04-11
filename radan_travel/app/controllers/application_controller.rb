class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception  
  before_filter :set_locale, :online_info
  before_filter :load_slides
  include ApplicationHelper
  include SimpleCaptcha::ControllerHelpers
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
      @online_now = Visit.where(started_at:  5.hour.ago..Time.now).count
      @contact = Page.find_by_title_en('Contact us')
    end
    def load_slides
      p @controller = params[:controller]     
      if @controller.present? 
        if @controller == 'tours' || @controller == 'hotels' || @controller == 'sights'
          @page_slides = Slide.where(slide_type: @controller)
          p  @page_slides.count
        else
          @other_slides = Slide.where("slide_type not in (?) OR slide_type IS NULL ", ['tours', 'hotels', 'sights'])
          p  @other_slides.count
        end
      end
      
    end
end
