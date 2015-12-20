json.array!(@articles) do |article|
  json.extract! article, :id, :title, :path, :keyword, :publication, :field, :author, :obligate1, :obligate2, :obligate3
  json.url article_url(article, format: :json)
end
