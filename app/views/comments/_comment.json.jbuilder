json.extract! comment, :id, :title, :body, :subject, :commentable_id, :commentable_type, :user_id, :parent_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
