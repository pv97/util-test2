json.extract! api_usage, :id, :user_id, :cost
json.age time_ago_in_words(api_usage.created_at)
