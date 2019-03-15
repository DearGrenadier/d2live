# frozen_string_literal: true

class MatchStartNotification
  include Rails.application.routes.url_helpers

  def initialize(match)
    @match = match
  end

  def send
    Chat.find_each do |chat|
      TELEGRAM_BOT_CLIENT.api.send_photo(chat_id: chat.id, photo: live_match_url(@match.id, format: :png))
    end
  end
end
