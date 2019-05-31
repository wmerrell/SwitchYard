# Main Application Controller
class ApplicationController < ActionController::Base
  private

  def current_user
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_user

  def authorize
    redirect_to login_url,
                alert: 'You must be logged in to access the requested page.' if current_user.nil?
  end
  helper_method :authorize

  def logged_in?
    !current_user.nil?
  end
  helper_method :logged_in?
end
