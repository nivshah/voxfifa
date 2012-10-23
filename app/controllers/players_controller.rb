class PlayersController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @players = Player.all
  end

  def new
    @player = Player.new
    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @post }
    end
  end

  def create
    @player = Player.new(params[:player])

    respond_to do |format|
      if @player.save
        format.html  { redirect_to(@player,
                      :notice => 'Player was successfully created.') }
        format.json  { render :json => @player,
                      :status => :created, :location => @player }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @player.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def show
    @player = Player.find(params[:id])
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])

    respond_to do |format|
      if @player.update_attributes(params[:player])
        format.html  { redirect_to(@player,
                      :notice => 'Player was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @player.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    respond_to do |format|
      format.html { redirect_to players_url }
      format.json { head :no_content }
    end
  end

end