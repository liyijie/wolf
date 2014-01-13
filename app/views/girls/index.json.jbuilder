json.array!(@girls) do |girl|
  json.extract! girl, :id, :qq, :city, :age, :height, :weight, :grade_id, :age_min, :age_max, :height_min, :height_max, :weight_min, :weight_max, :comment
  json.url girl_url(girl, format: :json)
end
