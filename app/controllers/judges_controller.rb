class JudgesController < ApplicationController
  
  before_filter :require_logged_in
  before_filter :require_event_coordinator, only: [:create, :new, :destory]
  
  # GET /judges
  # GET /judges.json
  def index
    @judges = Judge.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @judges }
    end
  end

  # GET /judges/1
  # GET /judges/1.json
  def show
    @judge = Judge.find(params[:id])
    
    @judge.event.competitors.each do |competitor|
      
      score_sheet = ScoreSheet.find_by_judge_id_and_competitor_id(@judge.id, competitor.id)
      
      @judge.build_score_sheet_for_competitor(competitor) if score_sheet.nil?
        
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @judge }
    end
  end

  # GET /judges/new
  # GET /judges/new.json
  def new
    @event = Event.find(params[:event_id])
    @judge = Judge.new(:event_id => @event.id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @judge }
    end
  end

  # GET /judges/1/edit
  def edit
    @judge = Judge.find(params[:id])
  end

  # POST /judges
  # POST /judges.json
  def create
    @judge = Judge.new(params[:judge])

    respond_to do |format|
      if @judge.save
        begin
          JudgeMailer.newjudge_email(@judge).deliver
        rescue 
          puts "********Could not send email*******"
        end
        format.html { redirect_to event_coordinator_event_path(@judge.event.event_coordinator, @judge.event), notice: 'Judge was successfully created.' }
        format.json { render json: @judge, status: :created, location: @judge }
      else
        format.html { render action: "new" }
        format.json { render json: @judge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /judges/1
  # PUT /judges/1.json
  def update
    @judge = Judge.find(params[:id])

    respond_to do |format|
      if @judge.update_attributes(params[:judge])
        format.html { redirect_to event_coordinator_event_path(@judge.event.event_coordinator, @judge.event), notice: 'Judge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @judge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /judges/1
  # DELETE /judges/1.json
  def destroy
    @judge = Judge.find(params[:id])
    event = @judge.event
    @judge.destroy

    respond_to do |format|
      format.html { redirect_to event_coordinator_event_path(event.event_coordinator, event) }
      format.json { head :no_content }
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
