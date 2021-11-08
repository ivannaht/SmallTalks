json.extract! comment, :id, :body, :user_id, :talk_id, :parent_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
