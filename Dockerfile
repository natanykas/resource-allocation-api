FROM ruby:3.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /resource-allocation-api
COPY Gemfile /resource-allocation-api/Gemfile
COPY Gemfile.lock /resource-allocation-api/Gemfile.lock
RUN bundle install
COPY . /resource-allocation-api

EXPOSE 3000