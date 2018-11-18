FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs cron nano
RUN mkdir /d2live
RUN touch /var/spool/cron/crontabs/$(whoami)
WORKDIR /d2live
ADD Gemfile Gemfile.lock /d2live/
RUN bundle install -j 10 --retry=5
ADD . /d2live
CMD puma -C config/puma.rb
