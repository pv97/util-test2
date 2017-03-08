# PV system

This application is built with rails connected to a postgres database.

## Tables

**Users**
  * username string
  * password_digest string  
  * session_token string

**Utilities**
  * string company_name

**Plans** belongs to utility
  * utility_id int
  * created_date timestamp
  * time_of_use float[]
    * arrays of pairs of threshold time hours,rate $/kWh, so length should always be even, and first entry value should be 0
    * example [0.0,10.0,2.0,20.0] for 0:00-2:00 users pay 10.0, 2:00 ownwards pay 20.0
  * month_of_use float[]
    * same as time but for months instead of hours
  * tiers float[]
    * arrays of pairs of threshold kWh,rate $/kWh, so length should always be even

**Subscriptions** belongs to user,utility
  * user_id int
  * utility_id int

**Utility_Usages** belongs to subscription
  * subscription_id int
  * kWh_used float
  * start_time timestamp
  * end_time timestamp

**Api_Usages** belongs to user
  * user_id int
  * created_at timestamp
