# Sweater Weather

The final project of the third quarter (Mod 3) of the [Turing School](https://turing.io/). Five-day duration, sole contributor.

## Overview
Based upon wireframe guidelines and example payloads for a fake weather and activity planning site ([project specs](https://backend.turing.io/module3/projects/sweater_weather/requirements)), endpoints for complex weather data, user authentication and authorization, and climbing and road trip activity planning were built out by interacting with the MapQuest, Mountain Project, Pixabay, and Open Weather APIs.
- Ruby on Rails API
- Responses serialized adherent to JSON 1.0 industry standards
- Test Driven Development with 100% coverage in RSpec Test Suite
- Continuous Integration with Travis CI
- Deployment to Heroku
- Focus on MVC design principals and REST

## Learning Goals
- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Research, select, and consume an API based on your needs as a developer

## Setup
#### Application:
- clone and setup `sweater_weather` locally 
   - `bundle install`
   - `rails db: create`
   - `rails db: migrate`
   - `rails db: seed`
   
#### API keys 

Run `bundle exec figaro install` to trigger the creation of a `/config/application.yml` file for configuring API keys. </br>

Sign up for the following API: </br>
[OpenWeather](https://home.openweathermap.org/users/sign_up)</br>
Add the following code snippet to your `/config/application.yml` file.      </br> 
Make sure to insert the key without the alligator clips ( < > ).</br>
```
OPEN_WEATHER_API_KEY: "<insert>"
```

Sign up for the following API: </br>
[Pixabay](https://pixabay.com/accounts/register/?source=main_nav)</br>
Add the following code snippet to your `/config/application.yml` file.      </br> 
Make sure to insert the key without the alligator clips ( < > ).</br>
```
PIXABAY_API_KEY: "<insert>"
```

Sign up for the following API: </br>
[MapQuest](https://developer.mapquest.com/plan_purchase/steps/business_edition/business_edition_free/register)</br>
Add the following code snippet to your `/config/application.yml` file.      </br> 
Make sure to insert the key without the alligator clips ( < > ).</br>
```
MAP_QUEST_API_KEY: "<insert>"
```

Sign up for the following API: </br>
[Mountain Project](https://www.mountainproject.com/) and click `Sign Up` </br>
Add the following code snippet to your `/config/application.yml` file.      </br> 
Make sure to insert the key without the alligator clips ( < > ).</br>
```
MOUNTAIN_PROJECT_API_KEY: "<insert>"
```

## Endpoint use:

[Postman](https://www.postman.com/downloads/) is recommended, but any API platform that allows you to run enpoint queries with query params and a request body will do! </br>

In `sweater_weather` run `rails s` to start the server. This will give you a port URL, something like `http://localhost:3000`, which is the main URI path for all the endpoint queries. In your API platform, the base URL will look like `http://localhost:3000/api/v1/<endpoint>` because all current endpoints are part of the first version of the API, and are therefore namespaced as such. </br>

### Example 1: 
#### Weather Endpoint (no body)

To run the `forecast` endpoint, the URL in your API platform would look like `http://localhost:3000/api/v1/forecast` and the query parameter you would include/append is `location=<city, state code>` something like "denver, co". The method for this endpoint is a `GET` which should also be set before running in the API platform.

In Postman, the setup for this endpoint looks like:
<img width="813" alt="Screen Shot 2020-10-12 at 12 53 05 PM" src="https://user-images.githubusercontent.com/62857073/95781095-5c63da00-0c8a-11eb-811a-2f73ff6180d0.png">

When run, the response returns the current weather:
</br>
<img width="692" alt="Screen Shot 2020-10-12 at 12 54 00 PM" src="https://user-images.githubusercontent.com/62857073/95781147-77364e80-0c8a-11eb-9f5e-8d3088edd68e.png">
</br>
Eight hours worth of hourly forecast:
</br>
<img width="693" alt="Screen Shot 2020-10-12 at 12 54 13 PM" src="https://user-images.githubusercontent.com/62857073/95781214-92a15980-0c8a-11eb-9ba1-59331d04f7cd.png">
</br>
And six days worth of daily forecast: 
</br>
<img width="692" alt="Screen Shot 2020-10-12 at 12 54 30 PM" src="https://user-images.githubusercontent.com/62857073/95781261-a8168380-0c8a-11eb-9879-384f8baaabe6.png">

Filtering the attributes included in each response based upon the wireframe for this endpoint: 
<img width="955" alt="Screen Shot 2020-10-12 at 12 54 50 PM" src="https://user-images.githubusercontent.com/62857073/95781290-bcf31700-0c8a-11eb-8a9f-41cc5183388e.png">

### Example 2: 
#### User Registration (with Body): 

To run the `users` endpoint, the URL in your API platform would look like `http://localhost:3000/api/v1/users` with the method set to `POST`. For this endpoint, we also need to send a request body with the users email, password, and password confirmation. In Postman, we will include this information as JSON under the body tab like this: 
<img width="817" alt="Screen Shot 2020-10-12 at 1 07 03 PM" src="https://user-images.githubusercontent.com/62857073/95781834-d779c000-0c8b-11eb-82bf-72df9cf55fad.png">

When run, the endpoint will return a JSON 1.0 standard response that includes the new users id, email, and an randomly generated api_key to handle authentication. This response looks like this: 
<img width="693" alt="Screen Shot 2020-10-12 at 1 07 35 PM" src="https://user-images.githubusercontent.com/62857073/95781980-160f7a80-0c8c-11eb-92df-f9c560b090ff.png">

For this endpoint, there is numerous sad paths built in all of which offering a standard JSON 1.0 format response, a helpful error message, and a corresponding status code. The first sad path for this endpoint concerns a failure of email uniqueness: 
<img width="694" alt="Screen Shot 2020-10-12 at 1 09 50 PM" src="https://user-images.githubusercontent.com/62857073/95782089-5242db00-0c8c-11eb-8fe1-81626e77eb66.png">

The second sad path concerns password / password confirmation mismatch: 
<img width="692" alt="Screen Shot 2020-10-12 at 1 10 29 PM" src="https://user-images.githubusercontent.com/62857073/95782099-5bcc4300-0c8c-11eb-9aef-5e103e552df2.png">

These sad paths are important catches in making sure that the application is used properly.

### Example 3:
#### Road Trip (Body with authentication, and data synthesis):

To run the `road_trip` endpoint, the URL in your API platform would look like `http://localhost:3000/api/v1/road_trip` with the method set to `POST`. For this endpoint, we also need to send a request body with a origin, destination, and authenticated users unique api_key. In Postman, we will include this information as JSON under the body tab like this: 
<img width="808" alt="Screen Shot 2020-10-12 at 1 15 41 PM" src="https://user-images.githubusercontent.com/62857073/95782410-14928200-0c8d-11eb-9842-c25f3086d9e0.png">

When run, the endpoint will return a standard JSON 1.0 response that synthesizes the following information per the [project specs](https://backend.turing.io/module3/projects/sweater_weather/requirements):
- a data attribute, under which all other attributes are present:
  - id, always set to null
  - type, always set to “roadtrip”
  - attributes, an object containing road trip information:
    - start_city, string, such as “Denver, CO”
    - end_city, string, such as “Estes Park, CO”
    - travel_time, string, something user-friendly like “2 hours, 13 minutes” or “2h13m” or “02:13:00” or something of that nature (you don’t have to include seconds); set this string to “impossible route” if there is no route between your cities
    - weather_at_eta, conditions at end_city when you arrive (not CURRENT weather), object containing:
      - temperature, numeric value in Fahrenheit
      - conditions, string, as given by OpenWeather
      
For the input of "denver, co" as origin and "pueblo, co" as destination, the response looks like: 
<img width="693" alt="Screen Shot 2020-10-12 at 1 19 46 PM" src="https://user-images.githubusercontent.com/62857073/95782742-9e424f80-0c8d-11eb-9d11-1cd36903f614.png">

This endpoint also has sad paths built to send a 401 Unathorized status code if the api_key sent in the body is invalid or nonexistant.

### Screen Cast of all Endpoints:

Below a screen cast is attached running through all the endpoints of the project:

## Testing: 

The `sweater_weather` application is fully tested using RSpec reporting ~100% test coverage determined by SimpleCov. 
To run the test suite, setup the application and run `bundle exec rspec` in the terminal. To run a specific test run `bundle exec rspec <test file path>`. To open the coverage report generated by SimpleCov run `open coverage/index.html`.

## Tools:
- Figaro
- Faraday
- FastJsonAPI
- Bcrypt
- VCR 
- WebMock
- Shoulda-Matchers
- GitHub
- RSpec
- Pry
- Launchy
- Capybara
- SimpleCov
- PostgreSQL

## Authors:

[Sienna Kopf](https://github.com/sienna-kopf)
