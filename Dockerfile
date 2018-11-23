FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev cron
RUN mkdir /d2live
WORKDIR /d2live
COPY Gemfile* /d2live/
RUN bundle install -j 10 --retry=5
COPY . /d2live
