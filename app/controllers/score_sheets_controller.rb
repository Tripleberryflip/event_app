class ScoreSheetsController < ApplicationController
  # GET /score_sheets
  # GET /score_sheets.json
  def index
    @score_sheets = ScoreSheet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @score_sheets }
    end
  end

  # GET /score_sheets/1
  # GET /score_sheets/1.json
  def show
    @score_sheet = ScoreSheet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @score_sheet }
    end
  end

  # GET /score_sheets/new
  # GET /score_sheets/new.json
  def new
    @score_sheet = ScoreSheet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @score_sheet }
    end
  end

  # GET /score_sheets/1/edit
  def edit
    @score_sheet = ScoreSheet.find(params[:id])
  end

  # POST /score_sheets
  # POST /score_sheets.json
  def create
    @score_sheet = ScoreSheet.new(params[:score_sheet])

    respond_to do |format|
      if @score_sheet.save
        format.html { redirect_to @score_sheet, notice: 'ScoreSheet was successfully created.' }
        format.json { render json: @score_sheet, status: :created, location: @score_sheet }
      else
        format.html { render action: "new" }
        format.json { render json: @score_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /score_sheets/1
  # PUT /score_sheets/1.json
  def update
    @score_sheet = ScoreSheet.find(params[:id])

    respond_to do |format|
      if @score_sheet.update_attributes(params[:score_sheet])
        format.html { redirect_to @score_sheet, notice: 'ScoreSheet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @score_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /score_sheets/1
  # DELETE /score_sheets/1.json
  def destroy
    @score_sheet = ScoreSheet.find(params[:id])
    @score_sheet.destroy

    respond_to do |format|
      format.html { redirect_to score_sheets_url }
      format.json { head :no_content }
    end
  end
end
