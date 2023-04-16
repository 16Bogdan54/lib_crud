json.extract! user_reccord, :id, :library_id, :user_id, :created_at, :updated_at
json.url user_reccord_url(user_reccord, format: :json)
