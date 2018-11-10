# frozen_string_literal: true

module Bot
  class Stop < Base
    KEY = '/stop'

    def execute
      Chat.find(chat_id).destroy
      TELEGRAM_BOT_CLIENT.api.send_message(chat_id: chat_id, text: I18n.t('commands.stop.success'))
    rescue StandardError
      TELEGRAM_BOT_CLIENT.api.send_message(chat_id: chat_id, text: I18n.t('commands.start.fail'))
    end
  end
end
