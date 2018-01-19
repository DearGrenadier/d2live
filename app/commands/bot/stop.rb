module Bot
  class Stop < Base
    KEY = '/stop'.freeze

    def execute
      Chat.find(chat_id).destroy
      TELEGRAM_BOT_CLIENT.api.send_message(chat_id: chat_id, text: I18n.t('commands.stop.success'))
    rescue
      TELEGRAM_BOT_CLIENT.api.send_message(chat_id: chat_id, text: I18n.t('commands.start.fail'))
    end
  end
end
