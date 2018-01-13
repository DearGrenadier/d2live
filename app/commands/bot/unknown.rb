module Bot
  class Unknown < Base
    def execute
      bot.api.send_message(chat_id: chat_id, text: I18n.t('commands.unknown'))
    end
  end
end
