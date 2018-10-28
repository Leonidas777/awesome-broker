# AwesomeBroker: *the real estate platform of your dream*

Requirements:
------------------
* Ruby 2.5.3
    
* PostgreSQL > 9.4

How to run the app
------------------
Prepare a database:

    rake db:create

    rake db:migrate

To pull the properties out of the Trovit's feed run:

    rake synchronize_properties:trovit

Run the server:

    rails s


Running in a Docker container
-----------------------------
The app is dockerized so you can run it in a container:

    docker-compose build

    docker-compose up

and by default it will be available on your local machine at `localhost:3000`

To deploy the app to production customize `docker-compose.yml`.
