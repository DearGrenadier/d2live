class MatchStartNotification
  include Rails.application.routes.url_helpers

  def initialize(match)
    @match = match
  end

  def send
    Chat.find_each do |chat|
      TELEGRAM_BOT_CLIENT.api.send_photo(chat_id: Chat.first.id, photo: live_match_url(@match.id, format: :jpg))
    end
  end
end