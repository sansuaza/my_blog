class ApplicationController < ActionController::Base
  # Only the autenticated users are able to navigate  in the app
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path
  end
end
