json.array!(@surveys) do |survey|
  json.extract! survey, :id, :name, :start_date, :end_date
  json.url survey_url(survey, format: :json)
end
