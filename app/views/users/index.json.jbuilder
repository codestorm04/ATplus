json.array!(@users) do |user|
  json.extract! user, :id, :email, :name, :admin, :sex, :institute, :phonenumber, :field, :obligate1, :obligate2, :obligate3
  json.url user_url(user, format: :json)
end
