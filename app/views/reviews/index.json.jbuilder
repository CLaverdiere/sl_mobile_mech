json.array!(@reviews) do |review|
  json.extract! review, :name, :text
  json.url review_url(review, format: :json)
end
