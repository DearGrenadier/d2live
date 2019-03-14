# frozen_string_literal: true

require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  root to: 'stats#index'
  resources :leagues, only: :index
  resources :live_matches, only: :index
  resources :finished_matches, only: :index
  post "telegram_#{ENV.fetch('SECRET_KEY_BASE')}" => 'telegram_webhook#show'

  resources :live_matches, only: :show
end
