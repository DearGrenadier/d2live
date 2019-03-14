# frozen_string_literal: true

require 'sidekiq-scheduler'

class TrackNewMatchesWorker
  include Sidekiq::Worker

  def perform
    response = Faraday.get('https://api.opendota.com/api/live')
    data = JSON.parse response.body

    saved_league_ids = League.pluck(:id)
    new_matches = data.select do |match_raw|
      saved_league_ids.include?(match_raw.fetch('league_id')) && !Match.exists?(match_raw.fetch('match_id'))
    end

    save_matches(new_matches)
  end

  private

  def save_matches(matches)
    matches.each do |match_raw|
      match_id = match_raw.delete('match_id')
      Match.create!(id: match_id, raw: match_raw)
    end
  end
end
