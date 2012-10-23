class MatchesController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @matches = Match.all
  end

  def new
    @match = Match.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @post }
    end
  end

  def create
    @match = Match.new(params[:match])
    @match.game_status = 'pre'
    respond_to do |format|
      if @match.save
        format.html { redirect_to(@match,
                      :notice => 'Match was successfully created.') }
        format.json { render :json => @match,
                      :status => :created, :location => @match }
      else
        format.html { render :action => "new" }
        format.json { render :json => @match.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def show
    @match = Match.find(params[:id])
  end

  def edit
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])
    @match.game_status = 'final'
    respond_to do |format|
      if @match.update_attributes(params[:match])
        format.html  { redirect_to(@match,
                      :notice => 'Match was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @match.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy

    respond_to do |format|
      format.html { redirect_to matches_url }
      format.json { head :no_content }
    end
  end

end