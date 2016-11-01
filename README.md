Ruby on Rails: Weather application
Emily Woods October 2016
Purpose: The purpose of this Ruby on Rails weather application is to gain exposure to different elements of app development.

=============================================================================================
Core tasks:
1) Implement a simple DB model in order to represent a certain location for a particular time
2) Display weather in a web browser for a particular location at a given time using routes, a controller and view
3) Implement a CRUD interface for the model as a JSON REST-API
4) Implement testing in the form of unit, integration and end-to-end testing
5) Add a gateway that displays current weather using an external API
6) Expand DB to save the current weather conditions for a given location, when queried.
7) Implement Slack integration
8) Install an asynchronous execution component to update the weather for all locations

------------------------------------------------------------------------------------------

Weather API: Dark Sky (https://darksky.net/51.5,-0.13)
Asynchronous execution component: delayed_job (https://github.com/collectiveidea/delayed_job)
DB: MySQL

-------------------------------------------------------------------------------------------

Access webview
Locations index: https://localhost:3000/locations
API view:
All locations: https://localhost:3000/api/v1/locations
Individual locations: https://localhost:3000/api/v1/locations/:id
Updated weather for a location: https://localhost:3000/api/v1/locations/:id/update_weather
