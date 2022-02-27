## Sweater-Weather

Sweater-Weather was a 5-day solo project for Module 3 Backend Engineering Curriculum at Turing School of Software and Design. It is a back-end Rails API for an application that plans road trips. The application is supposed to employ a service-oriented architecture, in which the front-end communicate with the back-end through an API. The details of the requirement for the project is specified [here](https://backend.turing.edu/module3/projects/sweater_weather/requirements).

#### What can I do on Virtual Escape?
  - Search for a destination and see matching photos
  - Create trips (these could be places that you've been to or have yet to visit)
  - Add photos to your trip
    - upload a file
    - or save from your search results
  - View stats like top saved destinations

*I created this API for my application to Shopify's Backend Engineering Internship program.  This is an API only (no user interface) but I plan to build out a React frontend for Virtual Escape.*

#### Stack
- Ruby on Rails, RSpec, PostgreSQL


# Readme Content
- [Local Setup](#local-setup)
- [Test Suite](#test-suite)
- [External APIs](#external-apis)
- [API Endpoints](#api-endpoints)
- [Contributor](#contributor)

# Local Setup
- Versions
  - Rails 5.2.6
  - Ruby 2.7.2
- Fork and clone this repository
- `cd` in your local repo version and run the following commands
  - To install gems:
    -  `bundle`
  - To setup database:
    - `rails db:create`
    - `rails db:migrate`
    - `rails db:seed`
- Run your own development server:
  - `rails s`
  - local server address is:  "http://localhost:3000" 

# Test Suite
- Run with `bundle exec rspec`
- All tests should be passing
- 99% test coverage

# External APIs
This API consumes the following APIs:
- [MapQuest Geocoding API](https://developer.mapquest.com/documentation/geocoding-api/) to search for latitude and longitude to a trip's location 
- [OpenWeather One Call API](https://openweathermap.org/api/one-call-api) to retrieve forecast data with the latitude and longitude from MapQuest API.
- [Unsplash Search Photos API](https://unsplash.com/documentation#search-photos) to search for an image to use as a background image for a location
  - Requirements for use: [properly provide attribution for the photographer and Unsplash](https://help.unsplash.com/en/articles/2511315-guideline-attribution)



# API Endpoints

  - **Weather Data for the Landing Page**:
    - Request Example: 
      ```
      GET "/api/v1/forecast?location=denver, co”
      ```
    - Response Example: 
      - Includes 1. Current Weather, 2. Hourly Weather for the next 8 hours and 3. Daily Weather for the next 5 days. 
     ```
        {
          "data": {
            "id": null,
            "type": "forecast",
            "attributes": {
              "current_weather": {
                "datetime": "2020-09-30 13:27:03 -0600",
                "temperature": 79.4,
                etc
              },
              "daily_weather": [
                {
                  "date": "2020-10-01",
                  "sunrise": "2020-10-01 06:10:43 -0600",
                  etc
                },
                {...} etc
              ],
              "hourly_weather": [
                {
                  "time": "14:00:00",
                  "conditions": "cloudy with a chance of meatballs",
                  etc
                },
                {...} etc
              ]
            }
          }
        }
      ```
 - **Background Image for the City**: 
    - Request Example: GET  “/api/v1/backgrounds?location=denver, co”
    - Response Example:
     ```
        {
          "data": {
            "type": "image",
            "id": null,
            "attributes": {
              "image": {
                "location": "denver,co",
                "image_url": "https://pixabay.com/get/54e6d4444f50a814f1dc8460962930761c38d6ed534c704c7c2878dd954dc451_640.jpg",
                "credit": {
                  "source": "pixabay.com",
                  "author": "quinntheislander",
                  "logo": "https://pixabay.com/static/img/logo_square.png"
                }
              }
            }
          }
        }
    ```
  
 - **Register a user with email and password and generate an api_key**: 
    - Request Example: POST '/api/v1/subscriptions/:id'
      - As JSON payload in the body of the request:
    ```
            {
              "email": "whatever@example.com",
              "password": "password",
              "password_confirmation": "password"
            }
    ```
    - Response Example:
    ```
      {
        "data": {
          "type": "users",
          "id": "1",
          "attributes": {
            "email": "whatever@example.com",
            "api_key": "jgn983hy48thw9begh98h4539h4"
          }
        }
      }
    ```
 - **Delete a subscription**: 
    - Request: DELETE '/api/v1/subscriptions/:id'
    - Response:
    ```
      {
        "message": "The subscription is successfully deleted"
      }
    ```
    
 - **Delete a subscription**: 
    - Request: DELETE '/api/v1/subscriptions/:id'
    - Response:
    ```
      {
        "message": "The subscription is successfully deleted"
      }
    ```

# Contributor
- Haewon Jeon      |  [Github](https://github.com/haewonito)   |   [LinkedIn](linkedin.com/in/haewonito)

