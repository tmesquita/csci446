class Member::GamesController < Member::MemberController
  # GET /games
  # GET /games.json
  def index
    @games = Game.paginate(:page => params[:page], :order => 'created_at desc', :per_page => 10).where(:user_id => current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @games }
    end
  end

  # GET /games/new
  # GET /games/new.json
  def new
    @game = Game.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
    unless @game.user.eql? current_user
      flash[:alert] = "Hey bro, you can't edit games that aren't yours!"
      redirect_to member_root_url
    end
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(params[:game])
    @game.user_id = current_user.id

    respond_to do |format|
      if @game.save
        format.html { redirect_to member_root_url, :notice => "Successfully added #{@game.title}" }
        format.json { render :json => @game, :status => :created, :location => @game }
      else
        format.html { render :action => "new" }
        format.json { render :json => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.json
  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to member_root_url, :notice => "Successfully updated #{@game.title}" }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to member_root_url }
      format.json { head :no_content }
    end
  end
end
