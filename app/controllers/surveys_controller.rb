class SurveysController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, except: [:index]
  before_action :set_survey, only: [:show, :edit, :update, :destroy, :results]

  # GET /surveys
  # GET /surveys.json
  def index
    if(current_user.admin?) 
      @surveys = Survey.all
    else
      @surveys = Survey.all
    end
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
  end

  # GET /surveys/1/edit
  def edit
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(survey_params)

    respond_to do |format|
      if @survey.save
        format.html { redirect_to surveys_path, notice: 'Survey was successfully created.' }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to surveys_path, notice: 'Survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    respond_to do |format|
      if @survey.destroy
        format.html { redirect_to surveys_url, notice: 'Survey was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to surveys_url, alert: 'Error when trying to destroy survey. Check for dependent records.' }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  def results

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.require(:survey).permit(:name, :start_date, :end_date)
    end
end
