json.extract! talk, :id, :title, :text, :photo, :likes_number, :dislikes_number, :comments_number, :shares_number, :user_id, :created_at, :updated_at
json.url talk_url(talk, format: :json)
