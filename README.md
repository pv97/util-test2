# PV system

This application is built with rails connected to a postgresql database. APIs are set up assuming a single page application.
To set up application,  run:
  * bundle install
  * rake db:setup
  * rails s

## Schema

schema file found in db/schema.rb

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

## API

For testing purposes, current_user has set to always be the "test" user.
Usable endpoints are found in config/routes.rb.
Database is seeded with one entry for each table, found in db/seeds.rb.

**Accessing API**

Since this is a single page application, the APIs can be accessed by ajax requests in the browser terminal
A sample ajax request is given by:
  1. Defining success callback:
    var success = function(val) { console.log(val) }
  2. Calling a request:
    $.ajax({
      url: `api/utilities/`,
      success:success
    });

**Charging User**

Currently, users are charged for looking at utilities index and utility usage index
