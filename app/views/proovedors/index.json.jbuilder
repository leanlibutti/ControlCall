json.array!(@proovedors) do |proovedor|
  json.extract! proovedor, :id, :name, :lines
  json.url proovedor_url(proovedor, format: :json)
end
