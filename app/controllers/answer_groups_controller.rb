class AnswerGroupsController < ApplicationController
  before_action :set_survey
  before_action :set_answer_group
  before_action :set_answers

  def new
    unless @survey.user_can_answer?(current_user)
      redirect_to surveys_path, :alert => t('access_denied')
    end
  end

  def create
    answer_group_params.each do |question_id, answer_attributes|
      if valid_question_id? question_id
        text = answer_attributes[:answer_text]
        @answer_group.answers.new(question_id: question_id, answer_text: text)
      end
    end
    @answer_group.save
    redirect_to surveys_path, notice: t('answers_saved')
  end

  private
  def set_survey
    @survey = Survey.find(params[:survey_id])
  end

  def set_answer_group
    @answer_group = AnswerGroup.new(user: current_user, survey: @survey)
  end

  def set_answers
    @answers = get_answers @survey.questions
  end

  def answer_group_params
    answer_params = params[:answer_group]
  end

  def valid_question_id? id
    @answers.any? { |q| q.question_id.to_s == id.to_s }
  end

  def get_answers questions
    @answers = questions.collect do |question|
      @answer = Answer.new(question_id: question.id)
    end
  end
end
