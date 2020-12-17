# Cab Management Portal

Implemented using Rails 6.0 with ruby '2.6.3'.

This portal is able to:
* Register cabs.
* Onboard various cities where cab services are provided.
* Change current city (location) of any cab.
* Change state of any cab.
* Book cabs based on their availability at a certain location.

### How to setup

run following commands in app root folder in order to set

`bundle install`

`rails db:migrate`

### How to run

`rails server`


### REST APIs 


Create a Cab resource

```
curl --location --request POST 'localhost:3000/cabs' --header 'Content-Type: application/json' --data-raw '{
	"cab": {
		"number" : 2,
		"city_id": 1,
		"state": "idle"
	}
}' 
```

Onboard cabs in Bulk

```
curl --location --request POST 'localhost:3000/cabs/bulk_onboard' \
--header 'Content-Type: application/json' \
--data-raw '{
	"cabs": [{
		"number" : 3,
		"city_id": 1,
		"state": "idle"
	},
	{
		"number" : 4,
		"city_id": 1,
		"state": "on_trip"
	}]
}'
```


Book a ride 

```
curl --location --request POST 'localhost:3000/cabs/book_ride?city_id=1' \
--header 'Content-Type: application/json'
```

Change City

```
curl --location --request PATCH 'localhost:3000/cabs/2/update_city?city_id=12' \
--header 'Content-Type: application/json'
```



