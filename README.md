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
- run specs `rspec`

## Features
- user can sign up/in
- user can search movies by keywords
- user can add movies to their favorite list.
- homepage shows the top rated & most popular movies.
- homepage shows the favorite movies for logged in users.

## Deployment
you can use the online version of this app [HERE](https://lynkss.herokuapp.com/), it's deployed on Heroku.
> `lynkss` in the url came from the reason this app create for; it was an assessment task for Lynks.
