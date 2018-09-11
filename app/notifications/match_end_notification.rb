class MatchEndNotification
  def initialize(match)
    @match = match
  end

  def send
    Chat.find_each do |chat|
      TELEGRAM_BOT_CLIENT.api.send_message(
        chat_id: chat.id, text: I18n.t('notifications.match_end', league: @match.league_name, teams: @match.teams)
      )
    end
  end
end
