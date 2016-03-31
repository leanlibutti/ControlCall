json.array!(@countries) do |country|
  json.extract! country, :id, :name, :code, :coef_n1, :coef_n2, :coef_r1, :coef_r2
  json.url country_url(country, format: :json)
end
