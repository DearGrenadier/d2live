# frozen_string_literal: true

class TrackDraftInfoWorker
  include Sidekiq::Worker

  LIVE_GAMES_URL = 'http://api.steampowered.com/IDOTA2Match_570/GetLiveLeagueGames/v1/'
  SIDES_MAPPING = { 'radiant' => true, 'dire' => false }.freeze

  def perform(match_id)
    response = Faraday.get(LIVE_GAMES_URL, key: ENV.fetch('STEAM_API_KEY'))

    match = JSON.parse(response.body).dig('result', 'games').find { |game| game.fetch('match_id') == match_id }

    return TrackDraftInfoWorker.perform_in(1.minute, match_id) unless draft_completed?(match)

    save_draft(match)
    MatchStartNotification.new(match_id).send
  end

  private

  def save_draft(match)
    save_bans(match)
    save_picks(match)
  end

  def save_picks(match)
    SIDES_MAPPING.each do |side, is_radiant|
      side_raw = match.dig('scoreboard', side)
      side_raw.fetch('picks').each do |pick|
        hero_id = pick.fetch('hero_id')
        player_id = side_raw.fetch('players').find { |player| player.fetch('hero_id') == hero_id }.fetch('account_id')

        Pick.create(
          match_id: match.fetch('match_id'), hero_id: pick.fetch('hero_id'), player_id: player_id, radiant: is_radiant
        )
      end
    end
  end

  def save_bans(match)
    SIDES_MAPPING.each do |side, is_radiant|
      match.dig('scoreboard', side, 'bans').each do |ban|
        Ban.create(match_id: match.fetch('match_id'), hero_id: ban.fetch('hero_id'), radiant: is_radiant)
      end
    end
  end

  def draft_completed?(match)
    players = %w[radiant dire].flat_map { |side| match.dig('scoreboard', side, 'players') }

    players.none? { |player| player.fetch('hero_id').zero? }
  end
end
