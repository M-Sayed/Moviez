# Lynks Challenge

## Prerequisites
- Ruby  2.5.3
- Rails 5.2.2
- MySQL 8.0.12

## Setup & Installation
- run bundles `bundle install`
- rename _**config/database.yml.example**_ to _**config/database.yml**_ and configure it.
- setup database `rake db:create db:migrate db:seed`
- add your **tmdb[:api_key]** to your secret `EDITOR=vi rails credentials:edit`
- run server `rails s -p3000`
- go to http://localhost:3000
