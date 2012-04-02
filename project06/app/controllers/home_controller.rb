class HomeController < ApplicationController
  before_filter :require_login, :only => :secret
  before_filter :require_user_url, :only => :seekers_public_profile
  
  #filter_access_to :all
  
  def index
    @games = Game.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @games }
    end
  end
end