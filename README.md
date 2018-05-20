# Welcome to ShortenerURL

## What's ShortenerURL 

ShortenerURL is an API based on [URL shortening technique](https://en.wikipedia.org/wiki/URL_shortening). 
It receives a long URL and returns a short URL, when you visit that short URL, it redirects to the original URL. 

## Framework

ShortenerURL was developed using RubyOnRails, a framework developed in Ruby that implements the MVC (Model-View-Controller) architectural pattern.

## Getting Started

* Setup

-  Start docker
    - First access: `docker-compose run web rails new . --force --database=postgresql`
    - `docker-compose up`

- Application access: `http://localhost:3000`

```
# https://docs.docker.com/compose/rails/#build-the-project
If you are running Docker on Linux, the files rails new created are owned by root. This happens because the container runs as the root user. If this is the case, change the ownership of the new files.
sudo chown -R $USER:$USER .
```

* Requests

- POST /shorten (Gets a short url)
  - `curl -X POST --header "Content-Type: application/json" --data '{"long_url": "www.google.com"}' http://localhost:3000/shorten/`

- GET /:short_url (Redirects from short to long url)
  - `curl -X GET --header "Content-Type: application/json" http://localhost:3000/a1b2c3`

- GET /metrics/:short_url (Gets number of clicks)
  - `curl -X GET --header "Content-Type: application/json" http://localhost:3000/metrics/a1b2c3`

## How to run the test suite

* Rails console access:
  - `docker-compose run web bash`
  - `bundle exec rspec spec/*`

## Improvements

- Add user model
- Change URL encoding algorithm. Use MD5, limit hash size and ensure there will be no collision

