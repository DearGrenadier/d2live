# frozen_string_literal: true

require 'sidekiq-scheduler'

class TrackFinishedMatchesWorker
  include Sidekiq::Worker

  def perform
    Match.live.each do |match|
      response = Faraday.get("https://api.opendota.com/api/match/#{match.id}")
      next if response.status == 404

      # data = JSON.parse response.body

      match.update!(finished: true)
      # MatchEndNotification.new(match).send
    end
  end
end
