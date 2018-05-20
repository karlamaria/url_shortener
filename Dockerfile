FROM ruby:2.5.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /url_shortener
WORKDIR /url_shortener
COPY Gemfile /url_shortener/Gemfile
COPY Gemfile.lock /url_shortener/Gemfile.lock
RUN bundle install
COPY . /url_shortener
