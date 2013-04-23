class EventCoordinatorsController < ApplicationController
  

  before_filter :require_event_coordinator, only: [ :edit, :update, :destory]
   
  # GET /event_coordinators
  # GET /event_coordinators.json
  def index
    @event_coordinators = EventCoordinator.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_coordinators }
    end
  end

  # GET /event_coordinators/1
  # GET /event_coordinators/1.json
  def show
    @event_coordinator = EventCoordinator.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_coordinator }
    end
  end

  # GET /event_coordinators/new
  # GET /event_coordinators/new.json
  def new
    @event_coordinator = EventCoordinator.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_coordinator }
    end
  end

  # GET /event_coordinators/1/edit
  def edit
    @event_coordinator = EventCoordinator.find(params[:id])
  end

  # POST /event_coordinators
  # POST /event_coordinators.json
  def create
    @event_coordinator = EventCoordinator.new(params[:event_coordinator])
        if @event_coordinator.save
          coordinator_sign_in @event_coordinator
          flash[:success] = "You Are Now Signed in"
          redirect_to @event_coordinator
        else
          render 'new'
        end
  end

  # PUT /event_coordinators/1
  # PUT /event_coordinators/1.json
  def update
    @event_coordinator = EventCoordinator.find(params[:id])

    respond_to do |format|
      if @event_coordinator.update_attributes(params[:event_coordinator])
        format.html { redirect_to @event_coordinator, notice: 'Event coordinator was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_coordinator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_coordinators/1
  # DELETE /event_coordinators/1.json
  def destroy
    @event_coordinator = EventCoordinator.find(params[:id])
    @event_coordinator.destroy

    respond_to do |format|
      format.html { redirect_to event_coordinators_url }
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
