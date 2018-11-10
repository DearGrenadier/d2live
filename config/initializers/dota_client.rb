# frozen_string_literal: true

Dota.configure do |config|
  config.api_key = ENV.fetch('STEAM_API_KEY')
end
DOTA_CLIENT = Dota.api
