# Description 
This is the back-end API for a fictional tea subscription service. The endpoints exposed on this API can be consumed by a team of front-end developers to build out the functionality of the service to allow users to select specific teas, how frequently they want them delivered, and cancel their subscriptions at any time.

# Technology Used
* Rails 6.0.6
* Ruby 2.7.2
* PostgreSQL Database
* [jsonapi-serializer](https://github.com/jsonapi-serializer/jsonapi-serializer) for API response serialization

# Local Setup Directions
```
git clone git@github.com:sjmann2/lunch-and-learn.git

cd lunch-and-learn

bundle install

rails db:{create,migrate,seed}

rails s
```

# Database Schema Diagram
![tea-subscription db](tea-database.png)

# Endpoints Available
## Base URL
http://localhost:3000/api/v1

## Subscribe customer to a tea subscription
POST `/subscriptions` and pass in a body containing customer id, title, frequency, price and array of tea ids
```JSON
{
"customer_id": 1,
"title": "Variety Pack",
"frequency": "Weekly",
"price": 30,
"teas": [1, 2, 3]
}
```
### Example response
```JSON
{
    "data": {
        "id": "1",
        "type": "subscription",
        "attributes": {
            "title": "Variety Pack",
            "frequency": "Weekly",
            "status": "active",
            "customer_id": 1,
            "price": 30.0
        }
    }
}
```

## Update subscription for a user
PATCH `/subscriptions` and pass in a body containing subscription id and status
```JSON
{
"subscription_id": 1,
"status": "cancelled"
}
```
### Example response
```JSON
{
    "data": {
        "id": "1",
        "type": "subscription",
        "attributes": {
            "title": "Variety Pack",
            "frequency": "Weekly",
            "status": "cancelled",
            "customer_id": 1,
            "price": 30.0
        }
    }
}
```

## Get all subscriptions for a customer
GET `/subscriptions` and pass in a body containing customer id
```JSON
{
  "customer_id": 1
}
```
### Example response
```JSON
{
    "data": [
        {
            "id": "1",
            "type": "subscription",
            "attributes": {
                "title": "Variety Pack",
                "frequency": "Weekly",
                "status": "active",
                "customer_id": 1,
                "price": 30.0
            }
        },
        {
            "id": "2",
            "type": "subscription",
            "attributes": {
                "title": "Variety Pack",
                "frequency": "Weekly",
                "status": "active",
                "customer_id": 1,
                "price": 30.0
            }
        }
    ]
}
 ```