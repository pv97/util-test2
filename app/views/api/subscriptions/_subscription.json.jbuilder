json.extract! subscription, :id, :user_id, :utility_id
json.company subscription.utility.company_name
json.age time_ago_in_words(subscription.created_at)
json.total_cost subscription.calculate

json.usages subscription.utility_usages.each do |utility_usage|
  json.set! utility_usage.id do
    json.partial! 'api/utility_usages/utility_usage', utility_usage: utility_usage
  end
end
