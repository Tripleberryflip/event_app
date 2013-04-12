class ScoreTemplatesController < ApplicationController
  # GET /score_templates
  # GET /score_templates.json
  def index
    @score_templates = ScoreTemplate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @score_templates }
    end
  end

  # GET /score_templates/1
  # GET /score_templates/1.json
  def show
    @score_template = ScoreTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @score_template }
    end
  end

  # GET /score_templates/new
  # GET /score_templates/new.json
  def new
    @score_template = ScoreTemplate.new({:event_id => event.id})

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @score_template }
    end
  end

  # GET /score_templates/1/edit
  def edit
    @score_template = ScoreTemplate.find(params[:id])
  end

  # POST /score_templates
  # POST /score_templates.json
  def create
    @score_template = ScoreTemplate.new(params[:score_template])

    respond_to do |format|
      if @score_template.save
        format.html { redirect_to @score_template, notice: 'Score template was successfully created.' }
        format.json { render json: @score_template, status: :created, location: @score_template }
      else
        format.html { render action: "new" }
        format.json { render json: @score_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /score_templates/1
  # PUT /score_templates/1.json
  def update
    @score_template = ScoreTemplate.find(params[:id])

    respond_to do |format|
      if @score_template.update_attributes(params[:score_template])
        format.html { redirect_to @score_template, notice: 'Score template was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @score_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /score_templates/1
  # DELETE /score_templates/1.json
  def destroy
    @score_template = ScoreTemplate.find(params[:id])
    @score_template.destroy

    respond_to do |format|
      format.html { redirect_to score_templates_url }
      format.json { head :no_content }
    end
  end
end
