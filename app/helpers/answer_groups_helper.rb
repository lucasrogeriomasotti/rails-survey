module AnswerGroupsHelper
	 def render_answer_form(answer, form)
      partial = answer.question.question_type.to_s.downcase
      render partial: "/answers/#{partial}", locals: { f: form, answer: answer }
    end
end
