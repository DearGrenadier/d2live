# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'carrierwave', '1.2.2'
gem 'dota', '0.0.21'
gem 'faraday', '0.9.2'
gem 'imgkit', '1.6.1'
gem 'mini_magick', '4.8.0'
gem 'pg', '0.21.0'
gem 'puma', '3.10.0'
gem 'rails', '5.1.6'
gem 'rubocop', '0.60.0', require: false
gem 'sidekiq', '5.0.5'
gem 'sidekiq-scheduler', '3.0.0'
gem 'telegram-bot-ruby', '0.8.4'
gem 'wkhtmltoimage-binary', '0.12.4', require: false

group :development, :test do
  gem 'dotenv-rails', '2.5.0'
  gem 'pry', '0.11.2'
  gem 'rspec-rails', '3.8.1'
end

group :development do
  gem 'listen', '3.1.5'
  gem 'spring', '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
end
