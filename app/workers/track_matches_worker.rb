# frozen_string_literal: true

require 'sidekiq-scheduler'

class TrackMatchesWorker
  include Sidekiq::Worker

  def perform
    response = Faraday.get('https://api.opendota.com/api/live')
    json = JSON.parse response.body
    league_matches = json.reject { |match| match['league_id'].zero? }
    league_match_ids = league_matches.map do |league_match|
      match_id = league_match['match_id']
      RegisterNewMatchWorker.perform_async(league_match) unless Match.exists?(match_id)
      match_id
    end
    register_finished_matches(league_match_ids)
  end

  private

  def register_finished_matches(league_match_ids)
    live_match_ids = Match.live.pluck(:id)
    finished_match_ids = live_match_ids - league_match_ids
    Match.where(id: finished_match_ids).each do |match|
      RegisterFinishedMatchWorker.perform_async(match.id)
    end
  end
end
