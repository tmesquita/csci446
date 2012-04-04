class Member::MemberController < ApplicationController
  before_filter :require_user
  filter_resource_access
  filter_access_to :all

  def index
    @games = Game.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @games }
    end
  end
end 