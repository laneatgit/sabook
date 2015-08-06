json.array!(@subjects) do |subject|
  json.extract! subject, :id, :name, :description, :subject_type
  json.url subject_url(subject, format: :json)
end