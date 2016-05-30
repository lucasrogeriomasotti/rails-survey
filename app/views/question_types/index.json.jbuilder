json.array!(@question_types) do |question_type|
  json.extract! question_type, :id, :name, :rating_scale, :rating_scale_start, :rating_scale_end
  json.url question_type_url(question_type, format: :json)
end
