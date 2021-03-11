class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Only the autenticated users are able to navigate  in the app
  before_action :authenticate_user!, if: :user_signed_in?
  before_action :authenticate_user!, except: [:index], if: !:user_signed_in?


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path
  end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name])
  end

  def custom_authenticacion_user
    if :user_signed_in?
      :authenticate_user!
    else
      :authenticate_user!
    end
  end

end
