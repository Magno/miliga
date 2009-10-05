class WeeksController < ApplicationController
	before_filter :login_required
  # GET /weeks
  # GET /weeks.xml
  def index
    @weeks = Week.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @weeks }
    end
  end

  # GET /weeks/1
  # GET /weeks/1.xml
  def show
    @week = Week.find(params[:id])
		@matches = @week.matches
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @week }
    end
  end

  # GET /weeks/new
  # GET /weeks/new.xml
  def new
    @week = Week.new(:tournament_id => params[:tournament_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @week }
    end
  end

  # GET /weeks/1/edit
  def edit
    @week = Week.find(params[:id])
  end

  # POST /weeks
  # POST /weeks.xml
  def create
    @week = Week.new(params[:week])

    respond_to do |format|
      if @week.save
        flash[:notice] = 'Week was successfully created.'
        format.html { redirect_to(@week) }
        format.xml  { render :xml => @week, :status => :created, :location => @week }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @week.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /weeks/1
  # PUT /weeks/1.xml
  def update
    @week = Week.find(params[:id])

    respond_to do |format|
      if @week.update_attributes(params[:week])
        flash[:notice] = 'Week was successfully updated.'
        format.html { redirect_to(@week) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @week.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /weeks/1
  # DELETE /weeks/1.xml
  def destroy
    @week = Week.find(params[:id])
    @week.destroy

    respond_to do |format|
      format.html { redirect_to(weeks_url) }
      format.xml  { head :ok }
    end
  end
end
