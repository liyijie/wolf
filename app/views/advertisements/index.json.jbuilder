json.array!(@advertisements) do |advertisement|
  json.extract! advertisement, :id, :title, :sub_title, :content
  json.url advertisement_url(advertisement, format: :json)
end
