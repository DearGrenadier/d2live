# frozen_string_literal: true

module Bot
  class Unknown < Base
    def execute
      TELEGRAM_BOT_CLIENT.api.send_message(chat_id: chat_id, text: I18n.t('commands.unknown'))
    end
  end
end
