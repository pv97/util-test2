json.extract! utility_usage, :id, :subscription_id, :kWh_used, :start_time, :end_time
json.age time_ago_in_words(utility_usage.created_at)
