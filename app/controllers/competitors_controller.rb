class CompetitorsController < ApplicationController
  
  before_filter :require_logged_in
  before_filter :require_event_coordinator, only: [:create, :new, :edit, :update, :destory]
  
  # GET /competitors
  # GET /competitors.json
  def index
    @competitors = Competitor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @competitors }
      format.js
    end
  end

  # GET /competitors/1
  # GET /competitors/1.json
  def show
    @competitor = Competitor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @competitor }
    end
  end

  # GET /competitors/new
  # GET /competitors/new.json
  def new
    @event = Event.find(params[:event_id])
    @competitor = Competitor.new(:event_id => @event.id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @competitor }
      format.js
    end
  end

  # GET /competitors/1/edit
  def edit
    @competitor = Competitor.find(params[:id])
  end

  # POST /competitors
  # POST /competitors.json
  def create
    @competitor = Competitor.new(params[:competitor])

    respond_to do |format|
      if @competitor.save
        format.html { redirect_to event_coordinator_event_path(@competitor.event.event_coordinator, @competitor.event), notice: 'Competitor was successfully created.' }
        format.json { render json: @competitor, status: :created, location: @competitor }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @competitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /competitors/1
  # PUT /competitors/1.json
  def update
    @competitor = Competitor.find(params[:id])

    respond_to do |format|
      if @competitor.update_attributes(params[:competitor])
        format.html { redirect_to event_coordinator_event_path(@competitor.event.event_coordinator, @competitor.event), notice: 'Competitor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @competitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competitors/1
  # DELETE /competitors/1.json
  def destroy
    @competitor = Competitor.find(params[:id])
    event = @competitor.event
    @competitor.destroy

    respond_to do |format|
      format.html { redirect_to event_coordinator_event_path(event.event_coordinator, event) }
      format.json { head :no_content }
    end
  end
  
  private
  
  def require_event_coordinator
    unless coordinator_signed_in?
      flash[:error] = "You Cant Do That, you are not an event coordinator!"
      redirect_to current_judge, notice: "You Cant Do That, you are not an event coordinator"
    end
  end
end
