json.array!(@answers) do |answer|
  json.extract! answer, :id, :questionid, :level, :title, :content, :answeruser, :filepath, :liker, :obligate1, :obligate2, :obligate3
  json.url answer_url(answer, format: :json)
end
