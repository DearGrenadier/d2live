# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'carrierwave', '1.2.2'
gem 'dota', '0.0.21'
gem 'faraday', '0.9.2'
gem 'figaro', '1.1.1'
gem 'foreman', '0.64.0'
gem 'imgkit', '1.6.1'
gem 'mini_magick', '4.8.0'
gem 'pg', '0.21.0'
gem 'puma', '3.10.0'
gem 'rails', '5.1.6'
gem 'rubocop', '0.60.0', require: false
gem 'sidekiq', '5.0.5'
gem 'telegram-bot-ruby', '0.8.4'
gem 'whenever', '0.9.7', require: false
gem 'wkhtmltoimage-binary', '0.12.4', require: false

group :development, :test do
  gem 'rspec-rails', '3.8.1'
  gem 'pry', '0.11.2'
end

group :development do
  gem 'capistrano', '3.10.0', require: false
  gem 'capistrano-bundler', '1.3.0', require: false
  gem 'capistrano-rails', '1.3.0', require: false
  gem 'capistrano-rake', '0.1.0', require: false
  gem 'capistrano-rbenv', '2.1.3', require: false
  gem 'capistrano-sidekiq', '0.20.0', require: false
  gem 'capistrano3-puma', '3.1.1', require: false
  gem 'listen', '3.1.5'
  gem 'spring', '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
end
