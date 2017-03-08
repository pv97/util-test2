@api_usages.each do |api_usage|
  json.set! api_usage.id do
    json.partial! 'api_usage', api_usage: api_usage
  end
end
