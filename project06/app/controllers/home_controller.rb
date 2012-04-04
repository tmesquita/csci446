class HomeController < ApplicationController
 skip_before_filter
  #filter_access_to :all
  
  def index
    @games = Game.paginate :page => params[:page], :order => 'created_at desc', :per_page => 10

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @games }
    end
  end
end