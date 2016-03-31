json.array!(@fichans) do |fichan|
  json.extract! fichan, :id, :code, :valor_sec_n, :valor_sec_r, :valor_min_n, :valor_min_r, :description
  json.url fichan_url(fichan, format: :json)
end
