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

```curl --location --request POST 'localhost:3000/cabs' \
--header 'Content-Type: application/json' \
--data-raw '{
	"cab": {
		"number" : 2,
		"city_id": 1,
		"state": "idle"
	}
}'```






