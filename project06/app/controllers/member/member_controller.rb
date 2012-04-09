class Member::MemberController < ApplicationController
  before_filter :require_user
  filter_access_to :all
  
  layout 'member'

  def index
    @games = Game.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @games }
    end
  end
end 