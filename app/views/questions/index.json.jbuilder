json.array!(@questions) do |question|
  json.extract! question, :id, :title, :content, :questionuser, :articleid, :field, :filepath, :liker, :obligate1, :obligate2, :obligate3
  json.url question_url(question, format: :json)
end
