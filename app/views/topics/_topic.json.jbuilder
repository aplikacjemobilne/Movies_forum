json.extract! topic, :id, :title, :user_id, :movie_id, :created_at, :updated_at
json.url topic_url(topic, format: :json)
    json.id post.id
    json.body post.body
    json.user_id post.user.id
end
