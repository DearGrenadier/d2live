# frozen_string_literal: true

# rubocop:disable Metrics/AbcSize

require 'sidekiq-scheduler'

class TrackFinishedMatchesWorker
  include Sidekiq::Worker

  def perform
    logger = Logger.new("#{Rails.root}/log/#{Rails.env}_#{self.class.name.underscore}.log")
    logger.info '----- Performing track finished matches job -----'

    Match.live.each do |match|
      response = Faraday.get("https://api.opendota.com/api/match/#{match.id}")
      next if response.status == '404'

      # data = JSON.parse response.body

      logger.info "Match <<#{match.id}>> is finished"
      match.update!(finished: true)
      # MatchEndNotification.new(match).send
    end
  end
end
# rubocop:enable Metrics/AbcSize
