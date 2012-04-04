class UsersController < ApplicationController
  #filter_resource_access
  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @user.role_id = Role.find_or_create_by_name("member").id
    respond_to do |format|
      if verify_recaptcha(@user) && @user.save 
        format.html { redirect_to root_url, :notice => 'Registration successful' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

end
