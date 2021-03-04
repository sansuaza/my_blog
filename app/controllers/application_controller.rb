class ApplicationController < ActionController::Base
  # Only the autenticated users are able to navigate  in the app
  before_action :authenticate_user!
end
