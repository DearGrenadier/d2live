# frozen_string_literal: true

require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  root to: 'stats#index'
  resources :leagues, only: :index
  resources :live_matches, only: %i[index show]
  resources :finished_matches, only: %i[index show]
  post "telegram_#{ENV.fetch('SECRET_KEY_BASE')}" => 'telegram_webhook#show'
end
