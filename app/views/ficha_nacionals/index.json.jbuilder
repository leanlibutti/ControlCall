json.array!(@ficha_nacionals) do |ficha_nacional|
  json.extract! ficha_nacional, :id, :interurbano, :valor_seg, :valor_min, :constant_id
  json.url ficha_nacional_url(ficha_nacional, format: :json)
end
