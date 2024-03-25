json.extract! message, :id, :contenu, :user_id, :discussion_id, :created_at, :updated_at
json.url message_url(message, format: :json)
