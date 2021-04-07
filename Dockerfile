FROM ruby:2.7.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

WORKDIR /resource-allocation-api

COPY Gemfile /resource-allocation-api/Gemfile

COPY Gemfile.lock /resource-allocation-api/Gemfile.lock

RUN bundle install

COPY . /resource-allocation-api

EXPOSE 3000
