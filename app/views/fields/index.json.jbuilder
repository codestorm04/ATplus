json.array!(@fields) do |field|
  json.extract! field, :id, :name, :level, :fatherid
  json.url field_url(field, format: :json)
end
