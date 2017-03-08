# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'

User.create(username:"test",password:"password",session_token:"12849147124")
Utility.create(company_name:"company")
ApiUsage.create(user_id:1,cost:0.10)
Plan.create(utility_id:1,month_of_use:[0,0],time_of_use:[0,1],tiers:[0,2])
Subscription.create(user_id:1,utility_id:1)
UtilityUsage.create(subscription_id:1,kWh_used:100,start_time:DateTime.new(2001,2,3,4,5,6),end_time:DateTime.new(2001,2,3,4,5,10))
