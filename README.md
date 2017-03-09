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
    * arrays rates $/kWh for each hour, so length should be 24
  * month_of_use float[]
    * same as time but for months instead of hours
  * tiers float[]
    * arrays of pairs of threshold kWh,rate $/kWh
    * example: [0,2,1000,3], every user pays $2 for every kWh, and an extra $3 for every kWh over 1000

**Subscriptions** belongs to user,utility
  * user_id int
  * utility_id int

**Utility_Usages** belongs to subscription, assumes a usage report comes in every hour
  * subscription_id int
  * kWh_used float
  * start_time timestamp
  * end_time timestamp

**Api_Usages** belongs to user
  * user_id int
  * created_at timestamp

## API

**Authentication**

I implemented the same authentication system as my other full stack projects.

**Accessing/testing API**

Routes are

```
resources :users, only: [:create, :show]
resource :session, only: [:create, :destroy]
resources :api_usages, only: [:index]
resources :utilities, only: [:index]
resources :subscriptions, only: [:index]
```

For testing purposes, current_user has set to always be the "test" user.
Usable endpoints are found in config/routes.rb.
Database is seeded with one entry for each table, found in db/seeds.rb.

Since this is a single page application, the APIs can be accessed by ajax requests in the browser terminal
A sample ajax request is given by:
  1. Defining success callback:
    var success = function(val) { console.log(val) }
  2. Users can make the requests:
    displays all utilities
    ```
    $.ajax({
      url: `api/utilities/`,
      success:success
    });
    ```
    returns [
      utilities: {
        utility info
      }
    ]

    displays subscribed utilities and their usages, coupled together for the sake of easy testing
    ```
    $.ajax({
      url: `api/subscriptions/`,
      success:success
    });
    ```
    returns [
      subscription:{
        subscription info,
        usage:[
          usage_info
        ]
      }
    ]

    displays api usage history
    ```
    $.ajax({
      url: `api/api_usage/`,
      success:success
    });
    ```
    returns [
      api_usage: {
        api usage info
      }
    ]

**Charging User**

Currently, users are charged for looking at utilities index and utility usage index

**Cost calculation**

Assumes an entry to utility_usage is added every hour. This is a quick implementation that makes it easy to calculate costs. This could handle about 7 million users.

**Scaling**

Once we have more than 6 million active users, we would have to worry about concurrency. A way to fix this is to make less write requests to the database for utility usages by batching up long periods of utility use. This means updating a user's uses less often, perhaps according to demand. This update should be able to be able to access a few hundred million users if updates sparse and no more than 4 million read requests are made per hour.
