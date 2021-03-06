class ApplicationController < ActionController::Base
  # before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :image, :image_cache, :email, :password, :password_confirmaion, :current_password, :introduction])
  end
    
    before_action :set_search
    
    def set_search
      @search = Room.ransack(params[:q])
      @search_articles = @search.result.order(id: "DESC")
      @count = @search_articles.count
    end
end
