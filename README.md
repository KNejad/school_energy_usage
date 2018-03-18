# School Energy Usage

A Rails project for the 2018 Dundee Data Jam.

Gets data about [energy consumption of schools](https://data.dundeecity.gov.uk/dataset/energy-consumption-of-schools) and visualises it using Google Maps

# Setup
  * This app uses PostgreSQL. In order to start, setup PostgreSQL with a user named `school_energy_usage` and a password `password`
  * Run `cp config/secrets.example.yml config/secrets.yml` and add a `google_maps_geocoding_api_key` key pair
  * Setup the database with: `rails db:create db:migrate`
  * Then import the data with: `rails import:school_gas_usage`

