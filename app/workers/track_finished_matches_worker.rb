# frozen_string_literal: true

require 'sidekiq-scheduler'

class TrackFinishedMatchesWorker
  include Sidekiq::Worker

  def perform
    Match.live.each do |match|
      response = Faraday.get("https://api.opendota.com/api/match/#{match.id}")
      json = JSON.parse response.body
      next if json.key? 'error'

      logger.info "Register finished match ##{match.id}"
      match.update!(finished: true)
      # MatchEndNotification.new(match).send
    end
  end
end
