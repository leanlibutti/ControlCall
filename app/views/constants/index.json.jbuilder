json.array!(@constants) do |constant|
  json.extract! constant, :id, :franco_oro, :proveedor_id, :ficha_local, :unidad_aire, :bloque_30
  json.url constant_url(constant, format: :json)
end
