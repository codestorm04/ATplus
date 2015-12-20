json.array!(@likes) do |like|
  json.extract! like, :id, :liketype, :likeid, :useremail
  json.url like_url(like, format: :json)
end
