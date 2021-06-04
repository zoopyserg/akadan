json.extract! blocked_user, :id, :name, :created_at, :updated_at
json.url blocked_user_url(blocked_user, format: :json)
