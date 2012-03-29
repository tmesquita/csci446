class Admin::AdminController < ApplicationController
  before_filter :require_user
  filter_access_to :all

  protected
	def permission_denied
	  flash[:error] = "You do not have access to #{request.path}"
	  respond_to do |format|
	    format.html {redirect_to_root}
		format.json { head :unauthorized }
	  end
	end
end	