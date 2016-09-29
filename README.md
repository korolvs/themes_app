# Themes app

[http://54.154.139.60:3000/](http://54.154.139.60:3000/)

## About

It is a simple app which helps you to customize basic colors(primary, secondary and background) of Bootstrap. You can create multiple "sites" with different themes.
Several times a minute the app checks for updates and, if something changes, runs docker container with grunt which creates new bootstrap.css for updated site.

## Used tools

### Backend
 - [Ruby on Rails](http://rubyonrails.org/)
 - [Sidekiq](http://sidekiq.org/)
 - [PostgreSQL](http://www.postgresql.org/)
 - [Redis](http://redis.io/)
 - [Docker](https://www.docker.com/)

### Frontend 
 - [AngularJS](https://angularjs.org/)
 
## Prerequisites
 - [Install Docker](http://docs.docker.com/linux/started/)
 - [Install Docker Compose](http://docs.docker.com/compose/install/)(Optional)
 - [Install Ruby](https://www.ruby-lang.org/en/downloads/)
 - [Install Bundler](http://bundler.io/)
 
## Usage

### Postgres and Redis

You can run Postgres and Redis with docker:

```
docker-compose up
```

### Development

Build 

```
docker build -t themesapp/grunt .
bundle install
rails db:create
rails db:migrate
``` 

Test

```
bundle exec rake test
```

Run

```
bundle exec sidekiq
rails s
```