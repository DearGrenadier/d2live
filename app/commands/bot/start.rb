module Bot
  class Start < Base
    KEY = '/start'.freeze

    def execute
      Chat.create!(id: chat_id)
      bot.api.send_message(chat_id: chat_id, text: I18n.t('commands.start.success'))
    rescue
      bot.api.send_message(chat_id: chat_id, text: I18n.t('commands.start.fail'))
    end
  end
end
