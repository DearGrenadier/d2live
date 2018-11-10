# frozen_string_literal: true

module Bot
  class Start < Base
    KEY = '/start'

    def execute
      Chat.create!(id: chat_id)
      TELEGRAM_BOT_CLIENT.api.send_message(chat_id: chat_id, text: I18n.t('commands.start.success'))
    rescue StandardError
      TELEGRAM_BOT_CLIENT.api.send_message(chat_id: chat_id, text: I18n.t('commands.start.fail'))
    end
  end
end
