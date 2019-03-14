# frozen_string_literal: true

require 'sidekiq-scheduler'

class TrackNewMatchesWorker
  include Sidekiq::Worker

  def perform
    response = Faraday.get('https://api.opendota.com/api/live')
    data = JSON.parse response.body
    league_matches = data.reject { |match| match['league_id'].zero? }
    league_matches.each do |league_match|
      RegisterNewMatchWorker.perform_async(league_match)
    end
  end
end
