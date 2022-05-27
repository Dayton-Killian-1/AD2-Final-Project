json.extract! comment, :id, :commentor_id, :commentroom, :game_id, :commenttext, :created_at, :updated_at
json.url comment_url(comment, format: :json)
