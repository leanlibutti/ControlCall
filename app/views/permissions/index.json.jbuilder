json.array!(@permissions) do |permission|
  json.extract! permission, :id, :activo, :user_id
  json.url permission_url(permission, format: :json)
end
