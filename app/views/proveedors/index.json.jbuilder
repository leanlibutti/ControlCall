json.array!(@proveedors) do |proveedor|
  json.extract! proveedor, :id, :name
  json.url proveedor_url(proveedor, format: :json)
end
