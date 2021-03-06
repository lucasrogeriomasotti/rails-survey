class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only
  before_action :set_question, only: [:show, :edit, :update, :destroy, :destroy_answers]
  before_action :set_survey, only: [:new, :create]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.survey = @survey

    respond_to do |format|
      if @question.save
        format.html { redirect_to survey_questions_url(@survey), notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    @survey = @question.survey
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to survey_questions_url(@survey), notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @survey = @question.survey
    respond_to do |format|
      if @question.destroy
        format.html { redirect_to survey_questions_url(@survey), notice: 'Question was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to survey_questions_url(@survey), alert: 'Error when trying to destroy question. Check for dependent records.' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy_answers
    @survey = @question.survey
    @question.answers.destroy_all
    respond_to do |format|
      format.html { redirect_to survey_questions_url(@survey), notice: 'Related answers were successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  def set_survey
    @survey = Survey.find(params[:survey_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def question_params
    params.require(:question).permit(:survey_id, :question_text, :answer_options, :position, :question_type)
  end
end
