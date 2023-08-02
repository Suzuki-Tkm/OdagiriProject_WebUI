class ApplicationController < ActionController::Base
  private def current_user
    User.find_by(id: cookies[:user_id]) if cookies[:user_id]
  end
  helper_method :current_user
end
