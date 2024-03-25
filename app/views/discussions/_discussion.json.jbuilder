json.extract! discussion, :id, :nom, :user_id, :created_at, :updated_at
json.url discussion_url(discussion, format: :json)
