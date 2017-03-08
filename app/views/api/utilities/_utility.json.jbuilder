json.extract! utility, :id, :company_name
json.age time_ago_in_words(utility.created_at)
json.plan utility.plans[0]
