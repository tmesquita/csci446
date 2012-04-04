class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter { |c| Authorization.current_user = c.current_user }
  #filter_parameter_logging "password"
  helper_method :current_user, :current_user_session
  #filter_resource_access

  protected

  def home_url_for(user)
    return root_url if user.nil?
    user.is_member? ? member_root_url : admin_root_url
  end

  def permission_denied
    flash[:alert] = "Sorry bro, you don't have access to that page."
    if current_user.is_member?
      redirect_to member_root_url
    elsif current_user.is_admin?
      redirect_to admin_root_url
    else
      redirect_to root_url
    end
  end

  def current_user
  	return @current_user if defined? @current_user
  	@current_user = current_user_session && current_user_session.record
  end

  def require_user
    unless current_user
      flash[:alert] = "You must be logged in to access that page"
      redirect_to :login
      return false
    end
  end

  def current_user_session
    return @current_user_session if defined? @current_user_session
    @current_user_session = UserSession.find
  end

  
end
