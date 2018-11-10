# frozen_string_literal: true

class TelegramWebhookController < ApplicationController
  def show
    data = JSON.parse(request.body.read)
    command_key = data.fetch('message').delete('text')
    BotCommandFactory.get_command(command_key).new(data).execute
    head :ok
  end
end
