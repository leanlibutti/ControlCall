json.array!(@localidads) do |localidad|
  json.extract! localidad, :id, :name, :interurbano, :clave_nqn
  json.url localidad_url(localidad, format: :json)
end
