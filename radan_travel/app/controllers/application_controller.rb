class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_locale
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
end
