source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '5.1.4'
gem 'pg', '0.21.0'
gem 'puma', '3.10.0'
gem 'figaro', '1.1.1'
gem 'faraday', '0.9.2'
gem 'telegram-bot-ruby', '0.8.4'
gem 'dota', '0.0.21'
gem 'whenever', '0.9.7', require: false

group :development, :test do
  gem 'pry', '0.11.2'
end

group :development do
  gem 'capistrano', '3.10.0', require: false
  gem 'capistrano-rails', '1.3.0', require: false
  gem 'capistrano3-puma', '3.1.1', require: false
  gem 'capistrano-rbenv', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rake', require: false
  gem 'listen', '3.1.5'
  gem 'spring', '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
end
