module Bot
  class Stop < Base
    KEY = '/stop'.freeze

    def execute
      Chat.find(chat_id).destroy
      bot.api.send_message(chat_id: chat_id, text: I18n.t('commands.stop.success'))
    rescue
      bot.api.send_message(chat_id: chat_id, text: I18n.t('commands.start.fail'))
    end
  end
end
