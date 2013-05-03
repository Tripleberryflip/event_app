class EventsController < ApplicationController
  
  before_filter :require_logged_in
  before_filter :require_event_coordinator, only: [:create, :new, :edit, :destory]
  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
      format.js
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new({:event_coordinator_id => current_coordinator.id})

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
      format.js
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to current_coordinator }
      format.json { head :no_content }
    end
  end
  
  def results
    @event = Event.find(params[:id])
    
    respond_to do |format|
      format.html #{ redirect_to event_results_path(@event) }
    end
  end
  
  private
  
  def require_event_coordinator
    unless coordinator_signed_in?
      flash[:error] = "You can't do that, you are not an event coordinator!"
      redirect_to current_judge, notice: "You can't do that, you are not an event coordinator!"
    end
  end
end
