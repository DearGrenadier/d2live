Rails.application.routes.draw do
  root to: 'stats#index'
  post "telegram_#{ENV.fetch('SECRET_KEY_BASE')}" => 'telegram_webhook#show'
end
