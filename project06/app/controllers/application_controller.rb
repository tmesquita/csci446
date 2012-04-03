class ApplicationController < ActionController::Base
  protect_from_forgery
  #filter_parameter_logging "password"

  helper_method :current_user, :current_user_session

  protected

  def home_url_for(user)
    return root_url if user.nil?
    user.is_member? ? members_root_url : admin_root_url
  end

  private

  def current_user_session
  	return @current_user_session if defined? @current_user_session
  	@current_user_session = UserSession.find
  end

  def current_user
  	return @current_user if defined? @current_user
  	@current_user = current_user_session && current_user_session.record
  end
end
