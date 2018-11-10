# frozen_string_literal: true

TELEGRAM_BOT_CLIENT = Telegram::Bot::Client.new(ENV.fetch('TELEGRAM_BOT_API_TOKEN'))
