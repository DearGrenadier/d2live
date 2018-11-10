FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /d2live
WORKDIR /d2live
ADD Gemfile /d2live/Gemfile
ADD Gemfile.lock /d2live/Gemfile.lock
RUN bundle install -j 10
ADD . /d2live
