# frozen_string_literal: true

desc 'Set Telegram webhook'
task :set_webhook, [:url] do |_, args|
  url = args.url || ENV.fetch('HOST_URL', nil)
  next puts "HOST URL can't be empty" unless url

  response = Faraday.post do |request|
    request.url "https://api.telegram.org/bot#{ENV.fetch('TELEGRAM_BOT_API_TOKEN')}/setWebhook"
    request.headers['Content-Type'] = 'application/x-www-form-urlencoded'
    request.body = { url: "#{url}/telegram_#{ENV.fetch('SECRET_KEY_BASE')}" }
  end
  puts response.body
end
