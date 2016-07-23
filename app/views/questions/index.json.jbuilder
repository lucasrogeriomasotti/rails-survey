json.array!(@questions) do |question|
  json.extract! question, :id, :question_text, :answer_options, :position, :question_type, :survey_id
  json.url question_url(question, format: :json)
end
